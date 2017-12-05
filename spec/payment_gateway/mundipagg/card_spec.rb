require 'spec_helper'

RSpec.describe PaymentGateway::Mundipagg::Card do
  describe '.initialize' do
    include_examples 'access key needed', PaymentGateway::Mundipagg::Card, 1
  end

  before do
    config_access_key
  end

  describe '#create' do
    let(:customer_id)  { "cus_yoqONwOJI1IBNbjl" }
    let(:url)          { "https://api.mundipagg.com/core/v1/customers/#{customer_id}/cards" }
    let(:valid_params) { RequestMocks::Mundipagg::Card.create }

    before do
      stub_mundipagg_request(:card, :create, :post, url, valid_params)
    end

    it "requests mundipagg api with POST https://api.mundipagg.com/core/v1/customers/cus_yoqONwOJI1IBNbjl/cards " do
      PaymentGateway::Mundipagg::Card.new(customer_id).create(valid_params)
      expect(WebMock).to have_requested(:post, url).with(body: valid_params)
    end
    
  end
end
