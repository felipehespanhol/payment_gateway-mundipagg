module ResponseMocks
  module Mundipagg

    module Customer
      class << self

        def create
          {
            id: 'cus_LwjJYE1iPjC60J8N',
            name: 'Tony Starkk',
            email: 'tonystarkk@avengers.com',
            document: '93095135270',
            type: 'individual',
            delinquent: false,
            address: {
              id: 'addr_8yLVA6ECWiyejRMp',
              street: 'Av. General Justo',
              number: '375',
              complement: '8th floor',
              zip_code: '20021130',
              neighborhood: 'Center',
              city: 'Rio de Janeiro',
              state: 'RJ',
              country: 'BR',
              status: 'active',
              created_at: '2017-08-21T20:10:02Z',
              updated_at: '2017-08-21T20:10:02Z'
            },
            created_at: '2017-08-21T20:10:02Z',
            updated_at: '2017-08-21T20:10:02Z',
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
              id: 'custom_id'
            }
           }
        end
      end
    end

  end
end
