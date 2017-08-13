class PortfoliosController < ApplicationController
    
        def index
            acct_id = params[:account_id]
            @portfolios = Portfolio.where(account_id: acct_id)
       end
    
end