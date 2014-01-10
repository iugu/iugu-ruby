require_relative '../../test_helper'

describe Iugu do
  it "must be defined" do
    Iugu::VERSION.wont_be_nil
  end
end
