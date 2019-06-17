Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :locations, only: %i(index show)
  resources :missions, only: %i(index show) do
    resource :answer, only: %i(show create), module: :missions
  end
end
