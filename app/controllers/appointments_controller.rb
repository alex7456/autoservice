class AppointmentsController < BaseController
  before_action :delete_old_appointments, only: [:index]

  private

  def base_params
    params.require(:appointment).permit(:car_id, :customer_id, :service_id, :appointment_date, :status)
  end

  def delete_old_appointments
    Appointment.where('appointment_date < ?', 1.month.ago).destroy_all
  end
end
