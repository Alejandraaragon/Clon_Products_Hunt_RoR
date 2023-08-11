Rails.application.routes.draw do
  resources :categories
  resources :products do 
      get 'search', on: :collection 
      resources 'comments', only: [:create]
      resources 'votes', only: [:create]
  end

  root "welcome#index"

end
