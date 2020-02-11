Rails.application.routes.draw do
  resources :checklists do
    resources :checklist_items do
      member do
        patch :complete
      end
    end
  end

  root "checklists#index"
end
