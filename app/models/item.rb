class Item < ApplicationRecord
  has_one :section_item 
  has_one :modifier
  has_many :item_modifier_group, dependent: :destroy 

  validates :type, presence: true, inclusion: { in: ['Product', 'Component'] }
  validates :identifier, presence: true, uniqueness: true
  validates :label, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
end
