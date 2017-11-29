module HelperMethods
  def config_access_key
    PaymentGateway::Mundipagg.configure { |config| config.access_key = "1234123412341234" }
  end

  def request_mock(gateway_class, method)
    request_mock_class = if gateway_class.is_a?(Symbol) || gateway_class.is_a?(String)
                           eval("RequestMocks::Mundipagg::#{gateway_class.capitalize}")
                         else
                           eval("RequestMocks::#{gateway_class.to_s.split('::').last(2)}")
                         end
    request_mock_class.send(method)
  end

  def stub_mundipagg_request(gateway_class, method, request_method, request_url, request_body={})
    self.config_access_key
    stub_request(request_method, request_url).
       with(
         body: request_body.to_json,
         headers: {
           'Authorization' => 'Basic MTIzNDEyMzQxMjM0MTIzNDo=',
           'Connection'    => 'close',
           'Content-Type'  => 'application/json',
           'Host'          => 'api.mundipagg.com',
           'User-Agent'    => 'http.rb/2.2.2'
         }
       ).
       to_return(
         status:  200,
         headers: { 'Content-type' => 'application/json' },
         body:    self.request_mock(gateway_class, method).to_json
       )
  end
end
