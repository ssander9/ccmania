class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.string :card_provider
      t.string :card_name
      t.string :card_network
      t.string :card_category
      t.integer :signup_bonus
      t.integer :signup_bonus_spending_requirement
      t.integer :annual_fee
      t.decimal :gas
      t.decimal :transit
      t.decimal :rideshare
      t.decimal :entertainment
      t.decimal :streaming
      t.decimal :dining
      t.decimal :grocery
      t.decimal :drugstore
      t.decimal :department_store
      t.decimal :clothing
      t.decimal :travel
      t.decimal :other

      t.timestamps
    end
  end
end
