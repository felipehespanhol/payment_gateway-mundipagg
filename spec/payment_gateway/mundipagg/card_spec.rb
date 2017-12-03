require 'spec_helper'

RSpec.describe PaymentGateway::Mundipagg::Card do
  describe '.initialize' do
    include_examples 'access key needed', PaymentGateway::Mundipagg::Card, 1
  end
end
