class CreateCreditCardsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards_users do |t|
      t.belongs_to :credit_card
      t.belongs_to :user
    end
  end
end
