# frozen_string_literal: true

class OrderSerializer < ApplicationSerializer
  attributes :id, :status, :amount, :created_at, :delivery, :department_number, :pay_type, :city, :note, :products

  def products
    prepare_products
  end

  private

  def prepare_products
    line_items.map do |line_item|
      order_product = object.products_info&.find { |item| item['id'] == line_item.product.id }
      product = line_item.product
      quantity = line_item.quantity
      price = order_product ? order_product['price'] : line_item.product.price
      { price: price, quantity: quantity }.merge(product.slice('id', 'name', 'slug', 'logo'))
    end
  end

  def line_items
    object.cart.line_items
  end
end
