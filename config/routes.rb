Rails.application.routes.draw do
  root to: 'kanbans#index'
  resources :kanbans do
    member do
      patch :move
    end
  end
  resources :kanban_bigs do
    member do
      patch :move
      delete :destroy
    end
  end
  resources :kanban_smalls do
    member do
      patch :move
      delete :destroy
    end
  end
  resources :cards do
    member do
      patch :move
      delete :destroy
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
