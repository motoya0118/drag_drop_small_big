Rails.application.routes.draw do
  resources :kanbans do
    member do
      patch :move
    end
  end
  resources :kanban_bigs do
    member do
      patch :move
    end
  end
  resources :kanban_smalls do
    member do
      patch :move
    end
  end
  resources :cards do
    member do
      patch :move
    end
  end
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
