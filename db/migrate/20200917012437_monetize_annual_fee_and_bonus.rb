class MonetizeAnnualFeeAndBonus < ActiveRecord::Migration[6.0]
  def change
    remove_column :credit_cards, :signup_bonus_spending_requirement, :decimal
    remove_column :credit_cards, :annual_fee, :decimal

    add_monetize :credit_cards, :signup_bonus_spending_requirement
    add_monetize :credit_cards, :annual_fee
  end
end
