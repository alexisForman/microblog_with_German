class User < ApplicationRecord
    validates :username, :email, presence:true, uniqueness: true, length: {minimum:2, maximum:50}
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
    has_secure_password


    has_many :blogs
end
