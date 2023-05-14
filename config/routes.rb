Rails.application.routes.draw do
  resources :camp_sites
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    # Twitter API認証用
    :omniauth_callbacks => 'users/omniauth_callbacks',
  }

  resources :camp_sites do
    resources :images, :only => [:create, :destroy] # support #create and #destroy
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'camp_sites#index'
end
