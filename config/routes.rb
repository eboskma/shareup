Shareup::Application.routes.draw do
  get '/dashboard' => 'welcome#dashboard'
  
  scope :api do
    resources :shares
  end

  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  devise_scope :user do
    get '/api/current_user' => 'users/sessions#show_current_user', defaults: { format: 'json' }
    post '/api/check/is_user' => 'users/users#is_user', defaults: { format: 'json' }
  end
  
  root to: 'welcome#index'
end
