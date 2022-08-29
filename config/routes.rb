Rails.application.routes.draw do
  devise_for :users
  
 root to: 'homes#top'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
 get 'home/about' => 'homes#about'
  
 resources :users, only: [:new, :show, :edit,:index,:update]
resources :books, only: [:new, :index, :show, :edit,:create,:destroy,:update]

end
