require 'spec_helper'

RSpec.describe PaymentGateway::Mundipagg::Customer do

  describe '.initialize' do
    include_examples 'access key needed', PaymentGateway::Mundipagg::Customer
  end
  
end
