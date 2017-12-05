module RequestMocks
  module Mundipagg

    module Customer
      class << self

        def create
          {
            name: 'Tony Starkk',
            email: 'tonystarkk@avengers.com',
            type: 'individual',
            document: '93095135270',
            gender: 'male',
            phones: {
              home_phone: {
                country_code: '55',
                area_code: '21',
                number: '000000000'
              },
              mobile_phone: {
                country_code: '55',
                area_code: '21',
                number: '000000000'
              }
            },
            address: {
              street: 'Av. General Justo',
              number: '375',
              complement: '8th floor',
              zip_code: '20021130',
              neighborhood: 'Center',
              city: 'Rio de Janeiro',
              state: 'RJ',
              country: 'BR'
            },
            metadata: {
              id: 'custom_id'
            }
          }
        end
      end
    end

  end
end
