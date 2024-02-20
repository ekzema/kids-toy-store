# frozen_string_literal: true

class Order < ApplicationRecord
  attribute :line_items

  # rubocop:disable Rails/InverseOf
  # belongs_to :cart, -> { unscoped { where.not(deleted_at: nil) } }
  belongs_to :cart
  validates :first_name, :last_name, :patronymic, :email, :phone, :pay_type, :delivery, presence: true
  validates :first_name, :last_name, :patronymic, length: { minimum: 3 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :phone, length: { is: 13 }
  validates :city, :department_number, presence: true, if: :delivery_method?
  validates :city, length: { minimum: 3 }, if: :delivery_method?

  enum pay_type: { privat_bank: 1, cash_on_delivery: 2, other_payment_method: 3 }
  enum delivery: { novaya_pochta: 1, ukrpochta: 2, self_delivery: 3 }
  enum status: { pending: 1, canceled: 2, approved: 3, sent: 4, completed: 5 }

  default_scope { order(created_at: :desc) }

  serialize :products_info, JSON

  def amount
    cart&.line_items&.sum do |line_item|
      order_product = products_info&.find { |item| item['id'] == line_item.product.id }
      quantity = line_item.quantity
      order_product ? order_product['price'] * quantity : line_item.product.price * quantity
    end
  end

  def full_name
    attributes.values_at('first_name', 'last_name', 'patronymic').compact.join(' ')&.strip
  end

  private

  def delivery_method?
    deliveries = Order.deliveries.except(:self_delivery).keys
    deliveries.include?(delivery)
  end
end
