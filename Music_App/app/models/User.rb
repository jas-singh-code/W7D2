# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  email           :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#
class User < ApplicationRecord
    validates :email, :session_token, :username, uniqueness: true
    validates :password, :session_token, :username, :email, :password_digest, presence: true
    validates :password, length: {minimum: 6, allow_nil: true} 
    
    attr_reader :password
    before_validation :ensure_session_token
    
    def self.find_by_crenditials(username, password)
        if username && is_password(password)
            return User.find_by(username: username)
        else
            return nil
        end
    end

    def self.generate_session_token
        session_token = SecureRandom.urlsafe_base64
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end


    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token 
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
end
