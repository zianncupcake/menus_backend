class Item < ApplicationRecord
  has_one :section_item, dependent: :destroy  
  has_one :modifier, dependent: :destroy 
  has_many :item_modifier_groups, dependent: :destroy
  has_many :modifier_groups, through: :item_modifier_groups

  validates :type, presence: true, inclusion: { in: ['Product', 'Component'] }
  validates :identifier, presence: true, uniqueness: true
  validates :label, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
end
