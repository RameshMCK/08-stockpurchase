Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'accounts#index'
  
      #adding additional custom routes under the resources
    resources :accounts, only:[:index, :new, :create]  do
        member do
            post '/portfolio', to: 'accounts#add_portfolio'
             get '/txn', to: 'accounts#txn'
            post '/deposit', to: 'accounts#deposit'
            post '/withdraw', to: 'accounts#withdraw'
        end
    end

    resources :portfolios, only:[:index, :new, :create]  do
        member do
            post '/portfolio', to: 'portfolios#purchase_stocks'
        end
    end

end
