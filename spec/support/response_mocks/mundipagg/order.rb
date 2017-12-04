module ResponseMocks
  module Mundipagg

    module Order
      class << self
        def list
          {
            data: [
              {
                id: 'or_28dN9w7CLU79kDjL',
                code: '62LVFN7I4R',
                amount: 2990,
                currency: 'BRL',
                closed: true,
                items: [
                  {
                    id: 'oi_d478RMAS3bC74PrL',
                    description: 'Tesseract Keychain',
                    amount: 2990,
                    quantity: 1,
                    status: 'active',
                    created_at: '2017-04-19T16: 01: 09Z',
                    updated_at: '2017-04-19T16: 01: 09Z'
                  }
                ],
                customer: {
                  id: 'cus_eaEXlZvhBfeGlDOm',
                  name: 'Tony Stark',
                  email: 'f1492621-4f39-45f7-adfb-82a373a0a85c@avengers.com',
                  delinquent: false,
                  created_at: '2017-04-19T16: 01: 09Z',
                  updated_at: '2017-04-19T16: 01: 09Z'
                },
                status: "paid",
                created_at: '2017-04-19T16: 01: 09Z',
                updated_at: '2017-04-19T16: 01: 11Z',
                closed_at: '2017-04-19T16: 01: 11Z',
                charges: [
                  {
                    id: 'ch_gmnW101c9YTvQVLB',
                    code: '62LVFN7I4R',
                    gateway_id: 'ef5e977b-93d2-485a-b15d-36e5eb3d8cf5',
                    amount: 2990,
                    status: "paid",
                    currency: 'BRL',
                    payment_method: 'credit_card',
                    paid_at: '2017-04-19T16: 01: 11Z',
                    created_at: '2017-04-19T16: 01: 09Z',
                    updated_at: '2017-04-19T16: 01: 09Z',
                    customer: {
                      id: 'cus_eaEXlZvhBfeGlDOm',
                      name: 'Tony Stark',
                      email: 'f1492621-4f39-45f7-adfb-82a373a0a85c@avengers.com',
                      delinquent: false,
                      created_at: '2017-04-19T16: 01: 09Z',
                      updated_at: '2017-04-19T16: 01: 09Z'
                    }
                  }
                ]
              },
              {
                id: 'or_dW6vZoJfLhw3Rb10',
                code: '65JGU05FX0',
                amount: 2990,
                currency: 'BRL',
                closed: true,
                items: [
                  {
                    id: 'oi_zYGxV8rU36HPWQMg',
                    description: 'Tesseract Keychain',
                    amount: 2990,
                    quantity: 1,
                    status: 'active',
                    created_at: '2017-04-19T15: 58: 23Z',
                    updated_at: '2017-04-19T15: 58: 23Z'
                  }
                ],
                customer: {
                  id: 'cus_rG3592i17uQgxK2Q',
                  name: 'Tony Stark',
                  email: '5d76b138-2963-40f7-ba71-c9ae2cc65518@avengers.com',
                  delinquent: false,
                  created_at: '2017-04-19T15: 58: 23Z',
                  updated_at: '2017-04-19T15: 58: 23Z'
                },
                status: 'failed',
                created_at: '2017-04-19T15: 58: 23Z',
                updated_at: '2017-04-19T15: 58: 24Z',
                closed_at: '2017-04-19T15: 58: 24Z',
                charges: [
                  {
                    id: 'ch_nM5PkjcyLUa6Nr1w',
                    code: '65JGU05FX0',
                    amount: 2990,
                    status: 'failed',
                    currency: 'BRL',
                    payment_method: 'credit_card',
                    created_at: '2017-04-19T15: 58: 23Z',
                    updated_at: '2017-04-19T15: 58: 24Z',
                    customer: {
                      id: 'cus_rG3592i17uQgxK2Q',
                      name: 'Tony Stark',
                      email: '5d76b138-2963-40f7-ba71-c9ae2cc65518@avengers.com',
                      delinquent: false,
                      created_at: '2017-04-19T15: 58: 23Z',
                      updated_at: '2017-04-19T15: 58: 23Z'
                    }
                  }
                ]
              }
            ],
            paging: {
              total: 406,
              next: 'https://api.mundipagg.com:4443/core/v1/orders?page=2&size=2'
            }
          }
        end

        def create
          {
            id: 'or_28dN9w7CLU79kDjL',
            code: '62LVFN7I4R',
            amount: 2990,
            currency: 'BRL',
            closed: true,
            items: [
              {
                id: 'oi_d478RMAS3bC74PrL',
                description: 'Tesseract Keychain',
                amount: 2990,
                quantity: 1,
                status: 'active',
                created_at: '2017-04-19T16: 01: 09Z',
                updated_at: '2017-04-19T16: 01: 09Z'
              }
            ],
            customer: {
              id: 'cus_eaEXlZvhBfeGlDOm',
              name: 'Tony Stark',
              email: 'f1492621-4f39-45f7-adfb-82a373a0a85c@avengers.com',
              delinquent: false,
              created_at: '2017-04-19T16: 01: 09Z',
              updated_at: '2017-04-19T16: 01: 09Z'
            },
            status: 'paid',
            created_at: '2017-04-19T16: 01: 09Z',
            updated_at: '2017-04-19T16: 01: 11Z',
            closed_at: '2017-04-19T16: 01: 11Z',
            charges: [
              {
                id: 'ch_gmnW101c9YTvQVLB',
                code: '62LVFN7I4R',
                gateway_id: 'ef5e977b-93d2-485a-b15d-36e5eb3d8cf5',
                amount: 2990,
                status: 'paid',
                currency: 'BRL',
                payment_method: 'credit_card',
                paid_at: '2017-04-19T16: 01: 11Z',
                created_at: '2017-04-19T16: 01: 09Z',
                updated_at: '2017-04-19T16: 01: 09Z',
                customer: {
                  id: 'cus_eaEXlZvhBfeGlDOm',
                  name: 'Tony Stark',
                  email: 'f1492621-4f39-45f7-adfb-82a373a0a85c@avengers.com',
                  delinquent: false,
                  created_at: '2017-04-19T16: 01: 09Z',
                  updated_at: '2017-04-19T16: 01: 09Z'
                },
                last_transaction: {
                  id: 'tran_3RYbBQjcnEcwrGp0',
                  transaction_type: 'credit_card',
                  gateway_id: 'ddab707d-72ba-49f9-b356-f0b9ebfa3039',
                  amount: 2990,
                  status: 'captured',
                  success: true,
                  installments: 1,
                  statement_descriptor: 'AVENGERS',
                  acquirer_name: 'simulator',
                  acquirer_affiliation_code: 'MUNDI',
                  acquirer_tid: '342793',
                  acquirer_nsu: '512784',
                  acquirer_auth_code: '233215',
                  acquirer_message: 'Stone|Transaction authorized successfuly',
                  acquirer_return_code: '0',
                  operation_type: 'auth_and_capture',
                  card: {
                    id: 'card_6xk9deAu2I2MdPzJ',
                    first_six_digits: '542501',
                    last_four_digits: '8229',
                    brand: 'Amex',
                    holder_name: 'Tony Stark',
                    exp_month: 1,
                    exp_year: 2018,
                    status: 'active',
                    created_at: '2017-04-19T16: 01: 09Z',
                    updated_at: '2017-04-19T16: 01: 09Z',
                    billing_address: {
                      street: 'Malibu Point',
                      number: '10880',
                      zip_code: '90265',
                      neighborhood: 'Central Malibu',
                      city: 'Malibu',
                      state: 'CA',
                      country: 'US'
                    },
                    type: 'credit'
                  },
                  created_at: '2017-04-19T16: 01: 09Z',
                  updated_at: '2017-04-19T16: 01: 09Z',
                  gateway_response: {
                    code: '201'
                  }
                }
              }
            ]
          }
        end
      end
    end

  end
end
