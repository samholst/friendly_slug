Rails.application.routes.draw do
  resources :topics
  resources :blogs
  root to: "blogs#index"
end
