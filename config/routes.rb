Rails.application.routes.draw do
  root to: "home#index"

  resources :accounts do
    resources :bills do
      resources :charges
    end
  end
end
