class CreateSeperateJoinTablesOwnedStarred < ActiveRecord::Migration[6.0]
  def change
    drop_table :credit_cards_users

    create_table :credit_cards_users_starred do |t|
      t.belongs_to :credit_card
      t.belongs_to :user
    end

    create_table :credit_cards_users_owned do |t|
      t.belongs_to :credit_card
      t.belongs_to :user
    end

  end
end
