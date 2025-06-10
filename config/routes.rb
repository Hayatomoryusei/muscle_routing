Rails.application.routes.draw do
  
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :motivations, only: [:index]
  resources :motivations do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :blogs do
    resources :goods, only: [:create, :destroy]
  end

  post 'ai_chats', to: 'ai_chats#create'

  root 'motivations#index'
end
