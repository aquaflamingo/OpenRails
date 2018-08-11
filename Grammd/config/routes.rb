Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :photos do
    member do
      put "like", to: "photos#upvote"
    end
  end

  root 'photos#index'
end
