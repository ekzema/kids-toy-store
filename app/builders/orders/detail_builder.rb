# frozen_string_literal: true

class Orders::DetailBuilder
  def perform
    build_response
  end

  private

  def build_response
    {
      pay_types: Order.pay_types.keys,
      deliveries: Order.deliveries.keys
    }
  end
end
