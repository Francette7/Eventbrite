Rails.application.routes.draw do

  devise_for :users
  root to: 'events#index'
  resources :events do
  	resources :attendances
  	resources :avatars, only: [:create]
  end
  resources :users, module: 'admin', only:[:show, :edit, :update] do
  	resources :profils, only: [:create]
 end

 namespace :admin do
 	root :to => "admin#index"
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
