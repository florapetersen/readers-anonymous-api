Rails.application.routes.draw do
  resources :book_club_books
  resources :books
  resources :book_clubs
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
