module RequestMocks
  module Mundipagg
    class Order
      def self.create
        {
          items: [
            {
              amount: 2990,
              description: 'Tesseract Keychain',
              quantity: 1
            }
          ],
          customer: {
            name: 'Tony Stark',
            email: 'tony@email.com'
          },
          ip: '52.168.67.32',
          location: {
            latitude: '-22.970722',
            longitude: '43.182365'
          },
          session_id: '322b821a',
          device: {
            platform: 'ANDROID OS'
          },
          payments: [{
            payment_method: 'credit_card',
            credit_card: {
              recurrence: false,
              installments: 1,
              statement_descriptor: 'AVENGERS',
              card: {
                number: '342793631858229',
                holder_name: 'Tony Stark',
                exp_month: 1,
                exp_year: 18,
                cvv: '3531',
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
            }
          }]
        }
      end
    end
  end
end
