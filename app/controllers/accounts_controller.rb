
class AccountsController < ApplicationController
    
   def index
        @accounts = Account.order(id: :desc)
   end

    def new
        @account = Account.new
    end

    def get_account
        @account = Account.find(params[:id])
        @portfolios =  @account.portfolios #since the relationship is set, it wil automatically pull out the children
    end
    
    def txn
        #self.get_account
        @account = Account.find(params[:id])
        @portfolios =  @account.portfolios #since the relationship is set, it wil automatically pull out the children
    end
    
    #account creattion
    def create
        @account = Account.new(params[:account].permit(:name, :balance))
        if @account.save
            redirect_to root_url
        else
            render 'new'
        end
    end
    
    #destroy account
    def destroy
        account = Account.find(params[:id])
        account.destroy
        redirect_to root_url
    end
    

    #add a portfolio to an account
    def add_portfolio
        @account = Account.find(params[:id])
        @account.add_portfolio(params[:name].to_s)
        @portfolios =  @account.portfolios.order(id: :desc)
        #self.get_account
        render 'txn'
    end

    def deposit
        @account = Account.find(params[:id])
        @account.deposit(params[:amount].to_f)
        @portfolios =  @account.portfolios.order(id: :desc)
        
        if @account.errors.any?
            render 'txn'
        else
            #redirect_to root_url
            render 'txn'
        end
    end

    def withdraw
        @account = Account.find(params[:id])
        @account.withdraw(params[:amount].to_f)
        @portfolios =  @account.portfolios.order(id: :desc)
        
        if @account.errors.any?
            render 'txn'
        else
            render 'txn' #redirect_to root_url
        end
    end
    
end