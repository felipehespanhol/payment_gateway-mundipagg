require 'spec_helper'

RSpec.describe PaymentGateway::Mundipagg::Order do

  describe '.initialize' do
    include_examples 'access key needed', PaymentGateway::Mundipagg::Order
  end

  before do
    config_access_key
  end
  
  describe '#list' do
    before do
      stub_mundipagg_request(:order, :list, :get, "https://api.mundipagg.com/core/v1/orders")
    end

    it 'returns a Hash' do
      expect(PaymentGateway::Mundipagg::Order.new.list).to be_a(Hash)
    end
  end
end
