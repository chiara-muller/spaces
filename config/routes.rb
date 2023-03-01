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
  delete 'my_bookings/:id', to: 'bookings#delete', as: 'my_bookings_delete'
  get 'my_bookings/:id/edit', to: 'bookings#edit', as: 'my_bookings_edit'
  patch 'my_bookings/:id', to: 'bookings#update', as: 'my_bookings_update'
end
