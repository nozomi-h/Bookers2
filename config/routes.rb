Rails.application.routes.draw do
  # get 'books/top'
  # get 'about' => 'books#about'
  # get 'users' => 'users#users'
  # get 'home' => 'users#home'
  # get 'bookers/:id/edit' => 'bookers#edit', as: 'edit_bookers'
 root 'books#top'
devise_for :users
resources :books
resources :users
get 'home/about' => 'books#about', as: 'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
