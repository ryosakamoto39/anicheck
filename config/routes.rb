Rails.application.routes.draw do
  get '/' => 'home#top', as: 'root'
  get 'search' => 'search#show', as: 'search'
  get 'tags/:tag' => 'item#show', as: :tag
  devise_for :users
  resources :items
  resources :reviews, except: %i[index show]
  resources :tags, only: %i[destroy]
  resources :comments, except: %i[index]
  resources :rooms, only: %i[index show create]
  resources :messages, only: [:create]
  resources :relationships, only: %i[create destroy]
  resources :comment_likes, only: %i[create destroy]
  resources :review_likes, only: %i[create destroy]
  resources :watched_items, only: %i[create destroy]
  resources :want_to_watch_items, only: %i[create destroy]
  resources :users, except: %i[index]
  resources :notifications, only: [:index, :destroy]
end
