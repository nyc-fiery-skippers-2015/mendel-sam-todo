Rails.application.routes.draw do
  resources :lists, except: [:edit, :update] do
    resources :tasks, except: [:index]
  end
end
