require 'spec_helper'

RSpec.describe PaymentGateway::Mundipagg::Customer do

  describe '.initialize' do
    include_examples 'access key needed', PaymentGateway::Mundipagg::Customer
  end

  before do
    config_access_key
  end

  describe '#create' do
    let(:valid_params) { RequestMocks::Mundipagg::Customer.create }

    before do
      stub_mundipagg_request(:customer, :create, :post, "https://api.mundipagg.com/core/v1/customers", valid_params)
    end

    it 'request mundipagg api with POST https://api.mundipagg.com/core/v1/customer' do
      PaymentGateway::Mundipagg::Customer.new.create(valid_params)
      expect(WebMock).to have_requested(:post, "https://api.mundipagg.com/core/v1/customers").
        with(body: valid_params)
    end

    it 'returns a customer id' do
      response = PaymentGateway::Mundipagg::Customer.new.create(valid_params)
      expect(response['id']).to eq(ResponseMocks::Mundipagg::Customer.create[:id])
    end
  end
  
end
