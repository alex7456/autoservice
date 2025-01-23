class ServicesController < BaseController
  private

  def base_params
    params.require(:service).permit(:name, :price)
  end
end
