class User < ApplicationRecord
    validates :username, presence: true, length: { maximum: 12 }
    VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_FORMAT }
    VALID_PASSWORD_FORMAT = /^[a-zA-Z]\w{6,12}/
    validates :password, presence: true, format: { with: VALID_PASSWORD_FORMAT }
end
