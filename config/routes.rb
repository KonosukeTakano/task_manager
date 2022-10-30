Rails.application.routes.draw do

  resource :users, :only => [:edit, :update]
  devise_for :users
  root to: 'homes#top'
  resources :tasks, :only => [:new, :create, :edit, :update, :destroy]
  resource :users, :only => [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
