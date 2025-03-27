class Menu < ApplicationRecord
  has_many :menu_sections, dependent: :destroy 

  validates :identifier, presence: true, uniqueness: true
  validates :label, presence: true
  validates :state, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
