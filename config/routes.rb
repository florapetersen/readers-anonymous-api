Rails.application.routes.draw do
  root to: "book_clubs#index"
  resources :user_book_clubs
  resources :book_club_books
  resources :books
  resources :book_clubs
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
