class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  validates :first_name, :last_name, :age, :phone_number, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end




