
class User < ApplicationRecord

    has_secure_password

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, confirmation: true, on: :create

end
