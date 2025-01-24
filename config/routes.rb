Rails.application.routes.draw do
  # Главная страница
  root "home#index"

  # Проверка здоровья приложения
  get "up" => "rails/health#show", as: :rails_health_check

  # CRUD-маршруты для сущностей
  resources :cars, except: [:show] # Маршрут show удален
  resources :customers
  resources :services
  resources :appointments
end
