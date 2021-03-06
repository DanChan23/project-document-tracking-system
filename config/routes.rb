Rails.application.routes.draw do
  resources :document_histories
  resources :permissions
  resources :documents
  resources :departments do
    collection do
      get 'retriever'
    end
  end
  
  resources :roles
  resources :user_logins
  get 'sessions/new'
  get 'documents/:id/viewer', to: 'documents#viewer', as: 'view_history'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  #get '*path' => redirect('/login')

  resources :users

  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
