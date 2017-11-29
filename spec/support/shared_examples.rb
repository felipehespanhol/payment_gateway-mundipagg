require 'set'

RSpec.shared_examples "access key needed" do |gateway_class, parameters|
  it 'requires access_key' do
    expect {
      if parameters
        gateway_class.new(parameters)
      else
        gateway_class.new
      end
    }.to raise_exception(PaymentGateway::Mundipagg::Base::MissingAccessKeyError)
  end
end
