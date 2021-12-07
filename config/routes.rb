Rails.application.routes.draw do
  root to: 'blogs#index'
  root to: 'blogs#new'
  root to: 'blogs#show'
  root to: 'blogs#edit'
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
