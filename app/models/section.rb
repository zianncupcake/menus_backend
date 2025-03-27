class Section < ApplicationRecord
  has_one :menu_section, dependent: :destroy
  has_many :section_items, dependent: :destroy 
  has_many :items, through: :section_items    

  validates :identifier, presence: true, uniqueness: true
  validates :label, presence: true
  validates :description, presence: true
end