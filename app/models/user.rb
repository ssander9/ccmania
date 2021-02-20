class User < ApplicationRecord
    has_and_belongs_to_many :starred_cards, join_table: :credit_cards_users_starred, class_name: 'CreditCard'
    has_and_belongs_to_many :owned_cards, join_table: :credit_cards_users_owned, class_name: 'CreditCard'
    # has_and_belongs_to_many :credit_cards, -> {distinct}
    has_secure_password
    has_one_attached :main_image

    monetize :gas_cents
    monetize :transit_cents
    monetize :rideshare_cents
    monetize :entertainment_cents
    monetize :streaming_cents
    monetize :dining_cents
    monetize :grocery_cents
    monetize :drugstore_cents
    monetize :department_store_cents
    monetize :clothing_cents
    monetize :travel_cents
    monetize :hotel_cents
    monetize :other_cents

    validates :name, presence: true
    validates :email, uniqueness: true, presence: true

    CATEGORIES = [:gas, :transit, :rideshare, :entertainment, :streaming, :dining, :grocery, :drugstore, :department_store, :clothing, :travel, :hotel, :other]
    
    def categories
        CATEGORIES
    end

end
