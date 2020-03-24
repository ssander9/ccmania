class AddHotelCategoryToCreditCardsAndUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :credit_cards, :hotel, :decimal
    add_monetize :users, :hotel 
  end
end
