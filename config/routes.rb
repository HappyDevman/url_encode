Rails.application.routes.draw do
  root 'links#index'
  resources :links do
    post :redirect_url, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
