class Service < ApplicationRecord
  has_many :appointments, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: /\A[А-Яа-яA-Za-z\s]+\z/, message: "может содержать только буквы" }
  validates :price, presence: true, numericality: { greater_than: 0 }
end
