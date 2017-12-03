RSpec.describe PaymentGateway::Mundipagg::Subscription do

  describe '.initialize' do
    include_examples 'access key needed', PaymentGateway::Mundipagg::Subscription
  end
  
end
