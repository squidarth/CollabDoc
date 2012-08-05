Collabdoc::Application.routes.draw do
  get "docs/index"

  get "docs/show"

  get "docs/edit"

  get "docs/update"

  get "docs/create"

  get "docs/destroy"

  devise_for :users
  
  resources :users
  resources :docs 
  root :to => "public#index"

  #static pages
end
