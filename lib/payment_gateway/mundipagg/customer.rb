module PaymentGateway
  module Mundipagg
    class Customer < Base

      def show(customer_id)
        url = "#{API_URL}/customers/#{customer_id}"
        request(:get, url)
      end

      def find(options)
        list_url = "#{API_URL}/customers"
        request(:get, list_url, params: options)
      end

      def list
        list_url = "#{API_URL}/customers"
        response = request(:get, list_url)
        response.parse['data']
      end

      def any?
        list&.any?
      end

      def create(customer_data)
        creation_url = "#{API_URL}/customers"
        request(:post, creation_url, body: create_customer_body(customer_data))
      end

      private

      def create_customer_body(customer_data)
        customer_data = customer_data.with_indifferent_access
        {
          name:     customer_data[:name],
          email:    customer_data[:email],
          type:     customer_data[:type] || 'individual',
          document: customer_data[:document],
          gender:   customer_data[:gender],
          phones: {
            home_phone: {
              country_code: customer_data[:phones][:home_phone][:country_code],
              area_code:    customer_data[:phones][:home_phone][:area_code],
              number:       customer_data[:phones][:home_phone][:number]
            },
            mobile_phone: {
              country_code: customer_data[:phones][:mobile_phone][:country_code],
              area_code:    customer_data[:phones][:mobile_phone][:area_code],
              number:       customer_data[:phones][:mobile_phone][:number]
            }
          },
          address: {
            street:       customer_data[:address][:street],
            number:       customer_data[:address][:number],
            complement:   customer_data[:address][:complement],
            zip_code:     customer_data[:address][:zip_code],
            neighborhood: customer_data[:address][:neighborhood],
            city:         customer_data[:address][:city],
            state:        customer_data[:address][:state],
            country:      customer_data[:address][:country]
          },
          metadata: customer_data[:metadata] || {}
        }
      end
    end
  end
end
