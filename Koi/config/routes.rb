Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]

  resources :topics do
    resources :unit_of_educations do
      member do
        patch :complete
      end
    end
  end

  root 'topics#index'
end
