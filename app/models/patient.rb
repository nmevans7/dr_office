class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
end

def full_name
'#{patient.first_name} #{patient.last_name}'
end
