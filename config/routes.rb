Rails.application.routes.draw do
  devise_for :users
  resources :checklists do
    resources :checklist_items do
      member do
        patch :complete
      end
    end
  end

  root "checklists#index"
end
