require 'bundler/setup'
Bundler.setup

require 'payment_gateway-mundipagg'
require 'webmock/rspec'
require 'pry-byebug'

Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  config.include HelperMethods
end
