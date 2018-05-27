Rails.application.routes.draw do
  resources :venues, only: [:show, :index]
  root :to => 'home#index'

  get 'cooccurrence_graph', to: 'cooccurrence_graph#index'
  get 'cooccurrence_graph/data', to: 'cooccurrence_graph#data'

  resources :events, only: [:show, :index]
  resources :songs, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
