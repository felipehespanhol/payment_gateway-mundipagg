module PaymentGateway::Mundipagg do
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :access_key

    def initialize
      @access_key = nil
    end
  end
end
