class CustomersController < BaseController
  private

  def base_params
    params.require(:customer).permit(:name, :phone, :email)
  end
end
