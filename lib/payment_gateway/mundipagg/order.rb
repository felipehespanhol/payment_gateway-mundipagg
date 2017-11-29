module PaymentGateway
  module Mundipagg

    class Order < Base

      def list
        request(:get, mount_url)
      end

      private

      def mount_url(relative_path="")
        "#{API_URL}/orders" + relative_path
      end

    end

  end
end
