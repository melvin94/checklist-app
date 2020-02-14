Rails.application.routes.draw do
  resources :roles
  devise_for :users, skip: [:sessions], controllers: {
                       passwords: "overridden_devise/passwords",
                       registrations: "overridden_devise/registrations",
                       sessions: "overridden_devise/sessions",
                       confirmations: "overridden_devise/confirmations",
                     }
  resources :users

  devise_scope :user do
    get "login", to: "overridden_devise/sessions#new"
    post "login", to: "overridden_devise/sessions#create"
    delete "logout", to: "overridden_devise/sessions#destroy"

    authenticated :user do
      root "users#index", as: :authenticated_root
    end

    unauthenticated :user do
      root to: redirect("/login"), as: :unauthenticated_root
    end
  end

  resources :checklists do
    resources :checklist_items do
      member do
        patch :complete
      end
    end
  end
end
