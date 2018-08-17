Rails.application.routes.draw do
  resources :todo_projects do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end
  
  resources :todo_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  root "todo_projects#index"
end
