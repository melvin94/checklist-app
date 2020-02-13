Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  resources :users

  devise_scope :user do
    get "login", to: "devise/sessions#new"
    post "login", to: "devise/sessions#create"
    delete "logout", to: "devise/sessions#destroy"
  end

  resources :checklists do
    resources :checklist_items do
      member do
        patch :complete
      end
    end
  end

  root to: redirect("/login")
end
