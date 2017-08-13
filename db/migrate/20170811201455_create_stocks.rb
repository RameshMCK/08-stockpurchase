class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.integer :noofshares
      t.integer :price
      
      t.belongs_to :portfolio, index: true, null: false
      t.timestamps
      
    end
    
    add_foreign_key :stocks, :portfolios
  end
end
