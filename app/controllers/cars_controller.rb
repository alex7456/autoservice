class CarsController < BaseController
  private

  def base_params
    params.require(:car).permit(:license_plate, :brand, :model, :year)
  end
end
