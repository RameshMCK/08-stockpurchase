class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      
      t.string :name 
      
      t.belongs_to :account, index: true, null: false # setting foregign key table is singular
      
      t.timestamps
    end
    
    add_foreign_key :portfolios, :accounts
  end
end
