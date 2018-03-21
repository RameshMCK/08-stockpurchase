class Portfolio < ApplicationRecord
    belongs_to :account
    has_many :transactions, dependent: :delete_all    
    
    def transaction_purchase(cmpy, quantity)
        price = transaction_price(cmpy)
        account = Account.find(self.account_id)
        balance = account.balance.to_f
        if price * quantity <= balance 
            t = Transaction.new(symbol: cmpy, noofshares: quantity, price: price, portfolio_id: self.id )
            t.save
            account.withdraw(price*quantity)
        end  
    end

    def transaction_sell(cmpy, quantity)
        price = transaction_price(cmpy)
        account = Account.find(self.account_id)
        num = self.transactions.where(symbol: cmpy).sum(:noofshares)
        if quantity <= num 
            t = Transaction.new(symbol: cmpy, noofshares: (-1*quantity), price: price, portfolio_id: self.id )
            t.save
            account.deposit(price*quantity)
        end  
    end

    def transaction_price(symbol)
        response = HTTParty.get("https://www.google.com/finance/getprices?q=#{symbol}&x=NASD&i=120&p=25m&f=c&df=cpct&auto=1&ts=1501179683973").parsed_response
        response.split("\n")[-1].to_f

        #r = HTTParty.get("https://www.google.com/finance/getprices?q=#{symbol.upcase}&x=NASD&i=120&p=15m&f=c&df=cpct").body
        #r.split("\n").last.to_f.round(2)
    end

    def transaction_worth
        self.transactions.sum('quantity * price')
    end

     def show_transactions
       self.transactions
     end
end