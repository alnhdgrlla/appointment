Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :doctors, only: [:index, :show, :edit, :update, :create]
  resources :patients, only: [:index, :show, :edit, :update, :create]
  resources :examination, only: [:index, :show, :edit, :update, :create]
end
