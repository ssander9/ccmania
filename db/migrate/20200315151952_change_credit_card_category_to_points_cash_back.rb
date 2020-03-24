class ChangeCreditCardCategoryToPointsCashBack < ActiveRecord::Migration[6.0]
  def change
    remove_column :credit_cards, :card_category
    add_column :credit_cards, :rewards_category, :string
  end
end
