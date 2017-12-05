module RequestMocks
  module Mundipagg

    module Card
      class << self
        def create
          { 
            number: '5425019448107793', 
            holder_name: 'Tony Stark', 
            holder_document: '93095135270', 
            exp_month: 1,
            exp_year: 18,
            cvv: '351',
            options: {
              verify_card: true
            }, 
            billing_address: {
              street: 'Malibu Point', 
              number: '10880', 
              zip_code: '90265', 
              neighborhood: 'Central Malibu', 
              city: 'Malibu', 
              state: 'CA', 
              country: 'US'
            }
          }
        end
      end
    end
  end
end
