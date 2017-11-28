Gem::Specification.new do |s|
  s.name        = "payment_gateway-mundipagg"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ["MIT"]
  s.summary     = "Easy integration with Mundipagg payment gateway services"
  s.email       = "felipeghespanhol@gmail.com"
  s.homepage    = "https://github.com/felipehespanhol/payment_gateway-mundipagg"
  s.description = "Easy integration with Mundipagg payment gateway services"
  s.authors     = ['Felipe G. Hespanhol']

  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 2.3.4'

  s.add_dependency("http", "~> 2.2", ">= 2.2.2")

  s.add_development_dependency("rspec", "3.6.0")
end
