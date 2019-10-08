Rails.application.routes.draw do
  resources :comments
  resources :topics
  resources :blogs
  root to: "blogs#index"
end
