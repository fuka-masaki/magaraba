class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    validates :password_digest,{presence:true}
    validates :name, uniqueness: true
    validates :name, length: { minimum: 1, maximum: 30 }
    has_secure_password
end