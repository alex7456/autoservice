class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::ConnectionNotEstablished, with: :handle_database_error
  rescue_from ActiveRecord::StatementInvalid, with: :handle_database_error

  private

  def handle_database_error(exception)
    flash[:alert] = "ОШИБКА : Нет соединения с базой данных. Пожалуйста, попробуйте позже."
    Rails.logger.error exception.message # Логируем ошибку
    redirect_to root_path # Перенаправляем пользователя на главную страницу
  end
end
