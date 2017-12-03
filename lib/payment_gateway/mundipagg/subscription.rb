module PaymentGateway
  module Mundipagg

    class Subscription < Base

      def list(query_parameters={})
        request(:get, mount_url, params: query_parameters)
      end

      def list_customer(customer_id, query_parameters={})
        raise "Customer id cannot be blank" if customer_id.blank?
        url = mount_url("?customer_id=#{customer_id}")
        request(:get, url, params: query_parameters)
      end

      def create(subscription_data)
        request(:post, mount_url, body: subscription_data)
      end

      # plan_id and payment_method are required
      def create_from_plan(subscription_data)
        validate_subscription_data(subscription_data)
        request(:post, mount_url, body: subscription_data)
      end

      def cancel(subscription_id)
        url = mount_url("/#{subscription_id}")
        request(:delete, url)
      end
      alias_method :destroy, :cancel

      private

      def mount_url(relative_path="")
        "#{API_URL}/subscriptions" + relative_path
      end

      def validate_subscription_data(subscription_data)
        subscription_data = subscription_data.with_indifferent_access
        [
          :plan_id,
          :payment_method
        ].each do |key|
          raise "Missing #{key} in subscription data" if subscription_data[key].blank?
        end
        if subscription_data[:payment_method].eql?('credit_card') && subscription_data[:credit_card].blank?
          raise "Missing credit card data"
        end
      end

    end

  end
end
