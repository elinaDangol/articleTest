Rails.application.routes.draw do
  get 'welcome/index'
  get'/articles/new'
  resources :articles
  root 'welcome#index'
  get '/weather/api'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
