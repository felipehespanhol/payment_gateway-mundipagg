module HelperMethods
  def config_access_key
    PaymentGateway::Mundipagg.configure { |config| config.access_key = "1234123412341234" }
  end

  def response_mock(gateway_class, method)
    response_mock_class = if gateway_class.is_a?(Symbol) || gateway_class.is_a?(String)
                           eval("ResponseMocks::Mundipagg::#{gateway_class.capitalize}")
                         else
                           eval("ResponseMocks::#{gateway_class.to_s.split('::').last(2)}")
                         end
    response_mock_class.send(method)
  end

  def stub_mundipagg_request(gateway_class, method, request_method, request_url, request_body={})
    stub_request(request_method, request_url).
       with(
         body: request_body.to_json,
         headers: {
           'Authorization' => 'Basic MTIzNDEyMzQxMjM0MTIzNDo=',
           'Connection'    => 'close',
           'Content-Type'  => 'application/json',
           'Host'          => 'api.mundipagg.com',
           'User-Agent'    => 'http.rb/3.0.0'
         }
       ).
       to_return(
         status:  200,
         headers: { 'Content-type' => 'application/json' },
         body:    self.response_mock(gateway_class, method).to_json
       )
  end
end
