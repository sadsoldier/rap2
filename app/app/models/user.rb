
class User < ApplicationRecord

    #has_secure_password

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true

    def authenticate(key)
        password == key
    end
end
