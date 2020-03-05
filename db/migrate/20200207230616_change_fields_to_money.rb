class ChangeFieldsToMoney < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :gas, :decimal
    remove_column :users, :transit, :decimal
    remove_column :users, :rideshare, :decimal
    remove_column :users, :entertainment, :decimal
    remove_column :users, :streaming, :decimal
    remove_column :users, :dining, :decimal
    remove_column :users, :grocery, :decimal
    remove_column :users, :drugstore, :decimal
    remove_column :users, :department_store, :decimal
    remove_column :users, :clothing, :decimal
    remove_column :users, :travel, :decimal
    remove_column :users, :other, :decimal

    add_monetize :users, :gas
    add_monetize :users, :transit
    add_monetize :users, :rideshare
    add_monetize :users, :entertainment
    add_monetize :users, :streaming
    add_monetize :users, :dining
    add_monetize :users, :grocery
    add_monetize :users, :drugstore
    add_monetize :users, :department_store
    add_monetize :users, :clothing
    add_monetize :users, :travel
    add_monetize :users, :other
  end
end
