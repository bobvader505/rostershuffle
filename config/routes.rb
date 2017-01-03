Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :teams
  resources :players
  resources :transactions

  get "/transactions/tweet/:id" => 'transactions#tweet'
  get "/newadmin/" => 'games#admin_show'
  get "/newadmin/:game_slug/" => 'regions#admin_show'

  get "/:game_slug/:region_slug" => 'games#show'

  root to: 'games#show', game_slug: '', region_slug: ''


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
