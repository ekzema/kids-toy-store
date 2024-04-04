# frozen_string_literal: true

class Orders::DetailBuilder
  def perform
    build_response
  end

  private

  def build_response
    {
      pay_types: prepare_enums('pay_types'),
      deliveries: prepare_enums('deliveries'),
      statuses:   prepare_enums('statuses')
    }
  end

  def prepare_enums(enum)
    Order.send(enum).keys.map { |key| { id: key, title: key.humanize } }
  end
end
