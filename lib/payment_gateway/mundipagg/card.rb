require 'credit_card_validations'

module PaymentGateway
  module Mundipagg
    class Card < Base
      class MissingCardDataAttributeError < StandardError; end
      class InvalidCardNumberError < StandardError; end

      attr_accessor :customer_id

      def initialize(customer_id)
        super()
        raise "User customer_id cannot be blank" if customer_id.blank?
        @customer_id = customer_id
      end

      def list
        request(:get, mount_url)
      end

      def show(card_id)
        request(:get, mount_url("/#{card_id}"))
      end

      def any?
        list&.any?
      end

      ### Card data ###
      #
      # {
      #   "number": "5425019448107793",
      #   "holder_name": "Tony Stark",
      # 	"holder_document": "93095135270",
      #   "exp_month": 1,
      #   "exp_year": 18,
      #   "cvv": "351",
      #   "billing_address": {
      #     street: "Malibu Point",
      #     "number": "10880",
      #     "ZIP code": "90265",
      #     "neighborhood": "Central Malibu",
      #     "city": Malibu,
      #     "state": "HERE",
      #     "country": "US"
      #   }
      # }
      def create(card_data)
        validate_card_data(card_data)
        request(:post, mount_url, body: card_request_body(card_data))
      end

      def destroy(credit_card_id)
        if credit_card_id.blank?
          raise "Credit card id cannot be blank"
        end
        response = request(:delete, mount_url("/#{credit_card_id}"))
      end

      def validate_card_data(card_data)
        validate_card_data_attributes_presence(card_data)
        validate_card_number((card_data[:number] || card_data['number']))
        validate_card_exp_date(card_data)
        validate_card_cvv((card_data[:cvv] || card_data['cvv']))
      end

      def validate_card_number(card_number)
        unless CreditCardValidations::Detector.new(card_number).valid?
          raise InvalidCardNumberError
        end
      end

      def validate_card_exp_date(card_data)
        exp_month = card_data[:exp_month] || card_data['exp_month']
        exp_year  = card_data[:exp_year] || card_data['exp_year']
        unless exp_month.is_a?(Integer) && exp_month.in?(1..12)
          raise "Invalid card exp_month, use integer from 1 to 12"
        end
        unless exp_year.is_a?(Integer) && exp_year.in?(0..50)
          raise "Invalid card exp_year, user integer from 0 to 50"
        end
      end

      def validate_card_cvv(cvv)
        raise "Invalid cvv" unless /^[0-9]{3,4}$/.match(cvv.to_s)
      end

      private

      def mount_url(relative_path="")
        "#{API_URL}/customers/#{@customer_id}/cards" + relative_path
      end

      def card_request_body(card_data)
        card_data = card_data.with_indifferent_access
        {
          number:          card_data[:number],
          holder_name:     card_data[:holder_name],
          holder_document: card_data[:holder_document],
          exp_month:       card_data[:exp_month],
          exp_year:        card_data[:exp_year],
          cvv:             card_data[:cvv],
          options:         { verify_card: true }
        }.tap { |body|
          if card_data[:billing_address].present?
            body[:billing_address] = parsed_billing_address(card_data)
          end
        }
      end

      def parsed_billing_address(card_data)
        card_data = card_data.with_indifferent_access
        billing_address = card_data[:billing_address]
        {
          street:       billing_address[:street],
          number:       billing_address[:number],
          zip_code:     billing_address[:zip_code],
          neighborhood: billing_address[:neighborhood],
          city:         billing_address[:city],
          state:        billing_address[:state],
          country:      billing_address[:country]
        }
      end

      def validate_card_data_attributes_presence(card_data)
        card_data = card_data.with_indifferent_access
        [
          :number,
          :holder_name,
          :holder_document,
          :exp_month,
          :exp_year,
          :cvv
        ].each do |key|
          if card_data[key].blank?
            raise MissingCardDataAttributeError, "Missing #{key} in card_data object"
          end
        end
      end
    end
  end
end
