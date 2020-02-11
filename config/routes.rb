Rails.application.routes.draw do
  resources :checklists do
    resources :checklist_items
  end

  root "checklists#index"
end
