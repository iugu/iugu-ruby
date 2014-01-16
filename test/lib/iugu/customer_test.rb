require_relative '../../test_helper'

describe Iugu::Customer do
  it "must be defined" do
    Iugu::Customer.wont_be_nil
  end

=begin

  describe "fetching customers" do
    describe "using a correct customer id" do
      before do
        @customer = Iugu::Customer.create({ email: "teste@teste.com", name: "Nome do Cliente" })
      end

      it "should return a customer object" do
        @customer.name = "NEW NAME"
        assert @customer.save
      end

      after do
        @customer.delete
      end
    end
  end

  describe "fetching customers" do
    describe "using a correct customer id" do
      before do
        @customer = Iugu::Customer.create({ email: "teste@teste.com", name: "Nome do Cliente" })
        @fetched_customer = Iugu::Customer.fetch @customer.id
      end

      it "should return a customer object" do
        assert @fetched_customer.is_a? Iugu::Customer
      end

      it "should have an id" do
        assert @fetched_customer.id && @fetched_customer.id.length > 0
      end
    end

    describe "using a wrong customer id" do
      it "should raise not found exception" do
        proc { @fetched_customer = Iugu::Customer.fetch "BLABLABLA" }.must_raise Iugu::ObjectNotFound
      end
    end
  end

  describe "creating customers" do
    before do
      @customer = Iugu::Customer.create({ email: "teste@teste.com", name: "Nome do Cliente" })
    end

    describe "using correct data" do
      it "should return a customer object" do
        assert @customer.is_a? Iugu::Customer
      end

      it "should have an id" do
        assert @customer.id && @customer.id.length > 0
      end
    end
  end

  describe "deleting customers" do
    before do
      @customer = Iugu::Customer.create({ email: "teste@teste.com", name: "Nome do Cliente" })
    end

    it "should return true" do
      assert @customer.delete  
    end
  end
=end
end
