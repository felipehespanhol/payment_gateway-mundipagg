class PaymentGateway::Mundipagg::Plan < PaymentGateway::Mundipagg::Base

  def list
    list_url = "#{API_URL}/plans"
    response = request(:get, list_url)
    response
  end

  def any?
    list.try(:any?)
  end

  # {
  #   "name"           => "Básico",
  #   "currency"       => "BRL",
  #   "interval"       => "month",
  #   "interval_count" => 1,
  #   "billing_type"   => "prepaid",
  #   "items" => [
  #     {
  #       "name"     => "Assinatura",
  #       "quantity" => 1,
  #       "pricing_scheme" => {
  #         # R$ 20,00
  #         "price" => 2000
  #       }
  #     }
  #   ],
  #   "metadata" => {
  #     "id" => "plano-basico"
  #   }
  # }
  def create(plan_data)
    validate_plan_data(plan_data)
    creation_url = "#{API_URL}/plans"
    request(:post, creation_url, body: plan_data)
  end

  def destroy(plan_id)
    destruction_url = "#{API_URL}/plans/#{plan_id}"
    request(:delete, destruction_url)
  end

  private

  def validate_plan_data(plan_data)
    raise "Plan data is missing name" if plan_data[:name].blank?
  end

end
