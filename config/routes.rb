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

    resources :portfolios  do
        member do
            post '/purchase', to: 'portfolios#purchase'
            post '/sell', to: 'portfolios#sell'
            get '/buy_stock', to: 'portfolios#buy_stock'
            get '/sell_stock', to: 'portfolios#sell_stock'
        end
    end

    resources :transactions, only: [:index] 
end
