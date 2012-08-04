Collabdoc::Application.routes.draw do
  devise_for :users

  root :to => "public#index"

  #static pages
end
