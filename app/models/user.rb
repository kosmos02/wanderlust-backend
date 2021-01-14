class User < ApplicationRecord
    has_secure_password
    validates :username, :name, :password, presence: true
end
