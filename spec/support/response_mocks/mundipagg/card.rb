module ResponseMocks
  module Mundipagg

    module Card
      class << self
        def create
          { 
            id: 'card_8ELY0AwVF9HDa3jK', 
            first_six_digits: '542501', 
            last_four_digits: '7793', 
            brand: 'Mastercard', 
            holder_name: 'Tony Stark', 
            holder_document: '93095135270', 
            exp_month: 1,
            exp_year: 2018,
            status: 'active', 
            created_at: '2017-07-07T19:50:33Z', 
            updated_at: '2017-07-07T19:50:33Z', 
            billing_address: {
              street: 'Malibu Point', 
              number: '10880', 
              zip_code: '90265', 
              neighborhood: 'Central Malibu', 
              city: 'Malibu', 
              state: 'CA', 
              country: 'US'
            },
            customer: {
              id: 'cus_yoqONwOJI1IBNbjl', 
              name: 'Tony Stark', 
              email: '0fee2dc5-e440-4dd1-9cd6-9c2bc90533d0@avengers.com', 
              document: '93095135270', 
              type: 'individual', 
              delinquent: false,
              created_at: '2017-07-07T19:50:23Z', 
              updated_at: '2017-07-07T19:50:23Z', 
              phones: {
                home_phone: {
                  country_code: '55', 
                  number: '000000000', 
                  area_code: '21'
                },
                mobile_phone: {
                  country_code: '55', 
                  number: '000000000', 
                  area_code: '21'
                }
              },
              metadata: {
                company: 'Avengers'
              }
            },
            type: 'credit'
          }
        end
      end
    end
  end
end
