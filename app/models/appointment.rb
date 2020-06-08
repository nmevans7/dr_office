class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :day, :month, :year, :time, :office_name, presence: true
  
  def full_year
    "#{self.day}/#{self.month}/#{self.year}"
  end
  
end

