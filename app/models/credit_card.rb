class CreditCard < ApplicationRecord

  validates :card_provider, presence: true
  validates :card_name, uniqueness: true, presence: true
  validates :card_network, presence: true
  validates :card_category, presence: true
  validates :annual_fee, presence: true
  validates :signup_bonus, presence: true
  validates :signup_bonus_spending_requirement, presence: true
  validates :gas, presence: true
  validates :transit, presence: true
  validates :rideshare, presence: true
  validates :entertainment, presence: true
  validates :streaming, presence: true
  validates :dining, presence: true
  validates :grocery, presence: true
  validates :department_store, presence: true
  validates :clothing, presence: true
  validates :travel, presence: true
  validates :other, presence: true

  after_validation :set_handle, only: [:create, :update]
  
  private

  def set_handle
    self.handle = "#{card_provider} #{card_name}".parameterize
  end
  
end
