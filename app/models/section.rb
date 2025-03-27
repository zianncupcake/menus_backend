class Section < ApplicationRecord
  has_one :menu_section
  has_many :section_items, dependent: :destroy

  validates :identifier, presence: true, uniqueness: true
  validates :label, presence: true
  validates :description, presence: true
end