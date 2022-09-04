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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
