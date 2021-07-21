Rails.application.routes.draw do
  resources :news
  resources :politicians do
    post :news, on: :member
  end
  resources :political_parties do
    post :news, on: :member
  end

  resources :users
  root 'static_pages#home'
  get '/politicos', to: 'politicians#index'
  get '/partidos', to: 'political_parties#index'
  get '/noticias', to: 'news#index'
  get '/modpartidos', to: 'political_parties#mod'
  get '/modnoticias', to: 'news#mod'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
