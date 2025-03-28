class Item < ApplicationRecord
  TYPES = %w[Product Component].freeze
  self.inheritance_column = nil

  has_one :section_item, dependent: :destroy
  has_one :section, through: :section_item
  has_one :modifier
  has_many :item_modifier_groups, dependent: :destroy
  has_many :modifier_groups, through: :item_modifier_groups

  validates :type, :identifier, :label, :description, :price, presence: true
  validates :identifier, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :type,
    inclusion: { in: TYPES, message: "must be either Product or Component" }
end
