class Account < ApplicationRecord
    has_many :portfolios
    
    validates :name, uniqueness: true
    
    #check if the combination already exists
    validates :name, presence: true
    #call backs
    #after_save :check_suspension


    def deposit(amount)
        
        #return if amount_is_not_valid(amount)
        ActiveRecord::Base.transaction do
            #note: need to use self or Account as a prefix when using balance, since it is not a variable or anythign defined in tis class
            self.update!(balance: self.balance + amount)
        end    
    end

    def withdraw(amount)
        #return if amount_is_not_valid(amount)
    
            ActiveRecord::Base.transaction do
                self.update!(balance: self.balance - amount)
            end
    end


    def add_portfolio(name)
        ActiveRecord::Base.transaction do
            Portfolio.create!(name: name, account_id: self.id)
        end
    end

    
    def create(name, category)

        #return if account_already_exists(name)
        #ActiveRecord is module or a name space
        #create transaction in rails
        ActiveRecord::Base.transaction do
            #note: need to use self or Account as a prefix when using balance, since it is not a variable or anythign defined in tis class
            Account.create!(name: name, balance: balance)
            #raise an error in rails
            #raise 'explode'
            #Portfolio.create!(name: name)
        end    
    end    


    def create_portfolio(name)
        
        #return if amount_is_not_valid(amount)
        ActiveRecord::Base.transaction do
            #note: need to use self or Account as a prefix when using balance, since it is not a variable or anythign defined in tis class
            Portfolio.create!(name: name, account_id: self.id)
        end    
    end
    

    
end