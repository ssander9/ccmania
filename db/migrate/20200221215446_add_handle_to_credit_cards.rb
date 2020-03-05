class AddHandleToCreditCards < ActiveRecord::Migration[6.0]
  def change
    add_column :credit_cards, :handle, :string 
  end
end
