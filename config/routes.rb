Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'landing#index'

get '/', to: 'landing#index'

#POSTS
    resources :posts do
        member do
          get :delete
        end
    end
  
  
#USERS
  resources :users do
      member do
        get :delete
      end
  end

  get '/logout', to: 'users#logout'
 get '/login', to: 'users#login'
 post '/login', to: 'users#login_attempt'



end
