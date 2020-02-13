Rails.application.routes.draw do
  devise_for :users, path_prefix: "devise"
  resources :users

  devise_scope :user do
    get "log_in", to: "devise/sessions#new"
    get "log_out", to: "devise/sessions#destroy"
    get "sign_up", to: "devise/registrations#new"
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
