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

    it 'request mundigagg api with GET https://api.mundipagg.com/core/v1/orders' do
      PaymentGateway::Mundipagg::Order.new.list
      expect(WebMock).to have_requested(:get, "https://api.mundipagg.com/core/v1/orders")
    end

    it 'returns a list or orders' do
      expect(PaymentGateway::Mundipagg::Order.new.list['data'].size).to eq(2)
    end
  end

  describe '#create' do
    let(:valid_params) { RequestMocks::Mundipagg::Order.create }

    before do
      stub_mundipagg_request(:order, :create, :post, "https://api.mundipagg.com/core/v1/orders", valid_params)
    end

    it 'request mundipagg api with POST https://api.mundipagg.com/core/v1/orders' do
      PaymentGateway::Mundipagg::Order.new.create(valid_params)
      expect(WebMock).to have_requested(:post, "https://api.mundipagg.com/core/v1/orders").
        with(body: valid_params)
    end

    it 'returns an order id' do
      response = PaymentGateway::Mundipagg::Order.new.create(valid_params)
      expect(response['id']).to eq(ResponseMocks::Mundipagg::Order.create[:id])
    end
  end
end
