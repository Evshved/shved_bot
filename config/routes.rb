Rails.application.routes.draw do
  root to: 'home#index'


  get 'users/profile', as: 'user_root'
  devise_for :users
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
