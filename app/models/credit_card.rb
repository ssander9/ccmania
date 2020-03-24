class CreditCard < ApplicationRecord
  has_and_belongs_to_many :starred_users, join_table: :credit_cards_users_starred, class_name: 'User'
  has_and_belongs_to_many :owned_users, join_table: :credit_cards_users_owned, class_name: 'User'
  # has_and_belongs_to_many :users, -> {distinct}

  validates :card_provider, presence: true
  validates :card_name, uniqueness: true, presence: true
  validates :card_network, presence: true
  validates :rewards_category, presence: true
  validates :annual_fee, presence: true
  validates :signup_bonus, presence: true
  validates :signup_bonus_spending_requirement, presence: true

  validates_presence_of [:gas, :transit, :rideshare, :entertainment, :streaming, :dining, :grocery, :drugstore, :department_store, :clothing, :travel, :hotel, :other]

  after_validation :set_handle, only: [:create, :update]
  
  def categories
    [:gas, :transit, :rideshare, :entertainment, :streaming, :dining, :grocery, :drugstore, :department_store, :clothing, :travel, :hotel, :other]
  end

  private

  def set_handle
    self.handle = "#{card_name}".parameterize
  end
  
end
