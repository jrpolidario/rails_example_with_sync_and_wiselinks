Rails.application.routes.draw do
  resources :posts, except: [:new]
end
