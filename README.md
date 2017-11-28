# Payment Gateway - Mundipagg

This library provides an easy integration with Mundipagg services in Ruby.

## Installation

### 1 - Include `gem "payment_gateway-mundipagg"` in your Gemfile.

### 2 - Set your access key given by Mundipagg

If your use Rails, create a file in initializer containing following code:

```
PaymentGateway::Mundipagg.configure do |config|
  config.access_key = "your-access-key-here"
end
```
Or else configure it manually.

### 3 - Call the referred service module you want to use. E.g.:

```
require 'payment_gateway/mundipagg/plan'

mundipagg_plan = PaymentGateway::Mundipagg::Plan.new
mundipagg_plan.list # Lists all registered plans
```

## Available services at the moment

All methods receives a hash as described in Mundipagg docs (https://docs.mundipagg.com/reference) and returns parsed gateway responses also as described in the docs in ruby Hash format.

### Plan

Methods:

- list
- create 
- destroy

### Card

- list
- create
- destroy

### Customer

- show
- list
- create

### Subscription

- list
- create
- create_from_plan
- cancel
