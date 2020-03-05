class User < ApplicationRecord
    has_secure_password

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
    monetize :other_cents

    validates :name, presence: true
    validates :email, uniqueness: true, presence: true

end
