class AddRewardsCategoriesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :gas, :decimal, default: 0
    add_column :users, :transit, :decimal, default: 0
    add_column :users, :rideshare , :decimal, default: 0
    add_column :users, :entertainment , :decimal, default: 0
    add_column :users, :streaming , :decimal, default: 0
    add_column :users, :dining , :decimal, default: 0
    add_column :users, :grocery , :decimal, default: 0
    add_column :users, :drugstore , :decimal, default: 0
    add_column :users, :department_store , :decimal, default: 0
    add_column :users, :clothing , :decimal, default: 0
    add_column :users, :travel , :decimal, default: 0
    add_column :users, :other , :decimal, default: 0
  end
end
