class Menu < ApplicationRecord
  has_many :menu_sections, dependent: :destroy
  has_many :sections, through: :menu_sections

  validates :identifier, :label, :state, :start_date, :end_date, presence: true
  validates :identifier, uniqueness: true

  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    errors.add(:end_date, "must be after start date") if end_date < start_date
  end
end
