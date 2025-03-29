class Item < ApplicationRecord
  TYPES = %w[Product Component].freeze
  self.inheritance_column = nil

  has_many :section_items, dependent: :destroy
  has_many :sections, through: :section_items
  has_one :modifier
  has_many :item_modifier_groups, dependent: :destroy
  has_many :modifier_groups, through: :item_modifier_groups

  validates :type, :identifier, :label, :description, :price, presence: true
  validates :identifier, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :type,
    inclusion: { in: TYPES, message: "must be either Product or Component" }
end
