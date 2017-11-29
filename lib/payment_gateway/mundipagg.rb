module PaymentGateway
  module Mundipagg
    class << self
      attr_accessor :configuration
    end

    def self.configure
      yield(configuration)
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    class Configuration
      attr_accessor :access_key

      def initialize
        @access_key = nil
      end
    end
  end
end
