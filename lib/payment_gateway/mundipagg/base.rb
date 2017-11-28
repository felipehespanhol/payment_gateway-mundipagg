require 'http'

class PaymentGateway::Mundipagg::Base
  class GatewayError < StandardError; end

  API_URL = 'https://api.mundipagg.com/core/v1'

  protected

  def request(method, url, options={ headers: {}, body: {}, params: {} })
    headers = { 'Content-Type' => 'application/json' }
    headers.merge!(options[:headers]) unless options[:headers].nil?
    response = HTTP.basic_auth(user: PaymentGateway::Mundipagg.configuration.access_key, pass: '').
                    headers('Content-Type' => 'application/json').
                    send(method, url, json: options[:body], params: options[:params])
    if response.status.eql?(200)
      response.parse
    else
      error_message = "#{response.status} - #{response.parse['errors']}"
      raise GatewayError, error_message
    end
  end

end
