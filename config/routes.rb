Rails.application.routes.draw do
  devise_for :users,
              controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
              }

  get 'member/data', to: 'members#show'
  get 'posts/index/:symbol', to: 'posts#index'
  post 'posts', to: 'posts#create'
  get 'lists/index', to: 'lists#index'
  post 'lists', to: 'lists#create'
  patch 'lists/:id', to: 'lists#update'
  get 'tickers/:search', to: 'tickers#index'
  get 'tickers_page/:page', to: 'tickers#page_index'
  get 'tickers_page/:page/:letter', to: 'tickers#page_index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
