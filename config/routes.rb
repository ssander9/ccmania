Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index'
  get '/about_us', to: 'home#about_us'
  get '/contact', to: 'home#contact'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/rewards_matrix', to: 'credit_cards#rewards_matrix'
  
  get '/credit_cards/:id/own_card', to: 'credit_cards#own_card', as: 'own_credit_card'
  get '/credit_cards/:id/remove_owned_card', to: 'credit_cards#remove_owned_card', as: 'remove_owned_credit_card'

  get '/credit_cards/:id/star_card', to: 'credit_cards#star_card', as: 'star_credit_card'
  get '/credit_cards/:id/remove_starred_card', to: 'credit_cards#remove_starred_card', as: 'remove_starred_credit_card'

  resources :credit_cards
  resources :users
end
