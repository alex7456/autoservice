class Customer < ApplicationRecord
  # Ассоциации
  has_many :appointments, dependent: :destroy
  has_many :cars, through: :appointments

  # Валидации
  validates :name, presence: true, format: { with: /\A[А-Яа-яA-Za-z\s]+\z/, message: "может содержать только буквы" }
  validates :phone, presence: true, format: { with: /\A\+?\d{10,15}\z/, message: "должен содержать от 10 до 15 цифр" }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "неверный формат email" }
end
