require 'http'

module PaymentGateway
  module Mundipagg

    class Base
      class GatewayError < StandardError; end
      class MissingAccessKeyError < StandardError; end

      API_URL = 'https://api.mundipagg.com/core/v1'

      def initialize
        access_key = PaymentGateway::Mundipagg.configuration.access_key
        raise MissingAccessKeyError if access_key.nil? || access_key.eql?('')
      end

      protected

      def request(method, url, options={ headers: {}, body: {}, params: {} })
        headers = { 'Content-Type' => 'application/json' }
        headers.merge!(options[:headers]) unless options[:headers].nil?
        response = HTTP.basic_auth(user: PaymentGateway::Mundipagg.configuration.access_key, pass: '').
                        headers('Content-Type' => 'application/json').
                        send(method, url, json: options[:body], params: options[:params])
        if response.status.eql?(200)
          response.parse.with_indifferent_access
        else
          error_message = "#{response.status} - #{response.parse['errors']}"
          raise GatewayError, error_message
        end
      end
    end

  end
end
