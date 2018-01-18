Rails.application.routes.draw do
  get 'library/index'
  resources :libraries
  resources :books
  resources :categories
  resources :members
  resources :issue_histories
  root 'library#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
