Rails.application.routes.draw do
  devise_for :users, skip: [:sessions], controllers: {
                       passwords: "devise/passwords",
                       registrations: "devise/registrations",
                       sessions: "devise/sessions",
                       confirmations: "devise/confirmations",
                     }
  resources :users

  devise_scope :user do
    get "login", to: "devise/sessions#new"
    post "login", to: "devise/sessions#create"
    delete "logout", to: "devise/sessions#destroy"

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
