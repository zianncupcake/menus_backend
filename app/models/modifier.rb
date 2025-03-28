class Modifier < ApplicationRecord
  belongs_to :modifier_group
  belongs_to :item

  validates :price_override, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
