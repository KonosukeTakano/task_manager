Rails.application.routes.draw do
  root to: 'homes#top'
  resources :tasks, :except => [:show]
  get "tasks/search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
