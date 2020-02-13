Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
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
