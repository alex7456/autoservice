class Car < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :customers, through: :appointments

  validates :license_plate, presence: true, uniqueness: { case_sensitive: false, message: "уже существует" }, format: { with: /\A[A-ZА-ЯЁ\d]{6}\z/i, message: "должен содержать 3 буквы и 3 цифры в любом порядке (пример: A666BW)"}
  validates :brand, presence: true, format: { with: /\A[^\d]+\z/, message: "не должна содержать цифры" }
  validates :model, presence: true
  validates :year, presence: true, numericality: { only_integer: true, message: "greater_than или равна 1900, менее или равно #{Date.today.year}" }
end
