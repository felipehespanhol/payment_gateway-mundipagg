require 'spec_helper'

RSpec.describe PaymentGateway::Mundipagg::Plan do

  describe '.initialize' do
    include_examples 'access key needed', PaymentGateway::Mundipagg::Plan
  end
  
end
