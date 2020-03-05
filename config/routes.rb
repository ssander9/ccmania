Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index'
  get '/about_us', to: 'home#about_us'
  get '/contact', to: 'home#contact'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/rewards_matrix', to: 'credit_cards#rewards_matrix'

  resources :credit_cards
  resources :users
end
