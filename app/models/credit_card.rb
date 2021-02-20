class CreditCard < ApplicationRecord
  has_and_belongs_to_many :starred_users, join_table: :credit_cards_users_starred, class_name: 'User'
  has_and_belongs_to_many :owned_users, join_table: :credit_cards_users_owned, class_name: 'User'
  # has_and_belongs_to_many :users, -> {distinct}
  has_one_attached :main_image
  validate :acceptable_image

  monetize :signup_bonus_spending_requirement_cents
  monetize :annual_fee_cents

  validates :card_provider, presence: true
  validates :card_name, uniqueness: true, presence: true
  validates :card_network, presence: true
  validates :rewards_category, presence: true
  validates :annual_fee, presence: true
  validates :signup_bonus, presence: true
  validates :signup_bonus_spending_requirement, presence: true

  validates_presence_of [:annual_fee, :gas, :transit, :rideshare, :entertainment, :streaming, :dining, :grocery, :drugstore, :department_store, :clothing, :travel, :hotel, :other]

  after_validation :set_handle, only: [:create, :update]
  
  CATEGORIES = [:gas, :transit, :rideshare, :entertainment, :streaming, :dining, :grocery, :drugstore, :department_store, :clothing, :travel, :hotel, :other]

  def categories
    CATEGORIES
  end

  def acceptable_image
    return unless main_image.attached?

    unless main_image.byte_size <= 1.megabyte
      errors.add(:main_image, "Image size is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(main_image.content_type)
      errors.add(:main_image, "Image must be a JPEG or PNG")
    end
  end

  private

  def set_handle
    self.handle = "#{card_name}".parameterize
  end
  
end
