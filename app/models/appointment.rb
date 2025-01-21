class Appointment < ApplicationRecord
  belongs_to :car
  belongs_to :customer
  belongs_to :service
end
