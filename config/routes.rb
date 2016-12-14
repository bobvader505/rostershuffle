Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :teams
  resources :players
  resources :transactions

  get "/transactions/tweet/:id" => 'transactions#tweet'
  get "/region/:slug" => 'regions#show'

  root to: 'regions#show', slug: 'na-lcs'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
