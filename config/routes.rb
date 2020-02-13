Rails.application.routes.draw do
  devise_for :users, path_prefix: "devise"
  resources :users

  devise_scope :user do
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
    get "signup", to: "devise/registrations#new"
  end

  resources :checklists do
    resources :checklist_items do
      member do
        patch :complete
      end
    end
  end

  root "checklists#index"
end
