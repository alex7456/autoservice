class Appointment < ApplicationRecord
  belongs_to :customer
  belongs_to :car
  belongs_to :service

  validates :appointment_date, presence: true
  validate :appointment_date_cannot_be_in_the_past

  def appointment_date_cannot_be_in_the_past
    if appointment_date.present? && appointment_date < Date.today
      errors.add(:appointment_date, "не может быть в прошлом")
    end
  end

  # Устанавливаем начальный статус по умолчанию
  after_initialize :set_default_status, if: :new_record?

  def set_default_status
    self.status ||= 'Запланировано'
  end

  validates :status, presence: true, inclusion: { in: ["Запланировано", "Завершено"], message: "должно быть 'Запланировано' или 'Завершено'" }
  validates :customer_id, presence: true
  validates :car_id, presence: true
  validates :service_id, presence: true
end
