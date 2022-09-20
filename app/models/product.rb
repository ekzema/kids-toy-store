class Product < ApplicationRecord
  enum status: { visible: 4, hidden: 5, available: 1, not_available: 2 }
end
