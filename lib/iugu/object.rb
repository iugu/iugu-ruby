require 'set'

module Iugu
  class Object

    undef :id if method_defined?(:id)

    def initialize(attributes = {})
      @unsaved_attributes = Set.new
      set_attributes attributes
    end

    def add_accessor(name)
      metaclass.instance_eval do
        define_method(name) { @attributes[name] }
        define_method(name + "=") do |value|
          @attributes[name] = value
          @unsaved_attributes.add name
        end
      end
      self.class.__send__ :attr_accessor, name.to_sym
    end

    def method_missing(name, *args)
      return super unless name.to_s.end_with? '='
      add_accessor(name.to_s[0...-1])
      return send(name, args[0])
    end

    protected

    def metaclass
      class << self; self; end
    end

    private

    def set_attributes(attributes)
      @attributes = attributes
      @attributes.each do |k, v|
        add_accessor(k)
        @attributes[k] = v
      end
    end

  end
end
