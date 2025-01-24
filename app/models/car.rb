class Car < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :customers, through: :appointments

  validates :license_plate, presence: true, uniqueness: { case_sensitive: false, message: "уже существует" }, format: { with: /\A[A-ZА-ЯЁ\d]{6}\z/i, message: "должен содержать 3 буквы и 3 цифры в любом порядке (пример: A666BW)"}
  validates :brand, presence: true, format: { with: /\A[^\d]+\z/, message: "не должна содержать цифры" }
  validates :model, presence: true
  validates :year, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1900,
    less_than_or_equal_to: Date.today.year,
    message: "должен быть целым числом от 1900 до #{Date.today.year}"
  }
  validates :license_plate, uniqueness: { scope: [:brand, :model], message: "Автомобиль с таким номером, маркой и моделью уже существует" }

end
