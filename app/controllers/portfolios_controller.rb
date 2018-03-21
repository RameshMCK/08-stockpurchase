
class PortfoliosController < ApplicationController
    
        def show
            #acct_id = params[:account_id]
            #@portfolios = Portfolio.where(account_id: acct_id)
            @portfolio = Portfolio.find(params[:id])
            #@stocks = @portfolio.show_stocks
            @stocks = @portfolio.transactions
       end
       
      def purchase
        @portfolio = Portfolio.find(params[:id])
        cmpy= params[:company]    
        quantity = params[:quantity].to_i

        @portfolio.transaction_purchase(cmpy, quantity)

        @stocks = @portfolio.show_transactions
        render 'show'
    end
    
     def sell
        @portfolio = Portfolio.find(params[:id])
        cmpy= params[:company]    
        quantity = params[:quantity].to_i
        @portfolio.transaction_sell(cmpy, quantity)

        @stocks = @portfolio.show_transactions
        render 'show'
    end

   


    def buy_stock
        @portfolio = Portfolio.find(params[:id])
    end

    def sell_stock
        @portfolio = Portfolio.find(params[:id])
    end

end