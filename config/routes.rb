Rails.application.routes.draw do
  
  get 'chats/show'
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about"
  
  get "search" => "searches#search"
  get "search_book" => "searches#search_book"
  
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy,] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create,:destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get 'search', to: "users#search"
  end
  
  resources :chats, only: [:show, :create]
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  
