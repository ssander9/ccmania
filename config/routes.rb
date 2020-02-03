Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index'
  get '/about_us', to: 'home#about_us'
  get '/contact', to: 'home#contact'
  get '/credit_cards', to: 'home#credit_cards'

  resources :users
end
