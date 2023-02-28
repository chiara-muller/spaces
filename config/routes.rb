Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :spaces do
    resources :bookings, only: [:new, :create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
  get 'my_bookings', to: 'bookings#all_my_bookings'
  get 'my_bookings/:id', to: 'bookings#show_my_bookings', as: 'my_bookings_show'
end
