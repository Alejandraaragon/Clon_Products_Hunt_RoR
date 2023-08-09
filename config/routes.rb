Rails.application.routes.draw do
  resources :categories


  resources :products

  root "main#welcome"

end
