require 'spec_helper'

RSpec.describe PaymentGateway do
  
  describe '#list' do
    context 'when missing access key' do
      include_examples 'access key needed', PaymentGateway::Mundipagg::Order
    end

    context 'with valid access key' do
      before do
        stub_mundipagg_request(:order, :list, :get, "https://api.mundipagg.com/core/v1/orders")
      end

      it 'returns a Hash' do
        expect(PaymentGateway::Mundipagg::Order.new.list).to be_a(Hash)
      end
    end
  end
end
