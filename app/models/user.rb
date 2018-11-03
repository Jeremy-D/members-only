class User < ApplicationRecord
	attr_accessor :remember_token
	before_save :remember

	validates :name, presence: true, length: { maximum: 50 }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, 
										format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }

	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	
	has_secure_password

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(string)
		Digest::SHA1.hexdigest(string.to_s)
	end


	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(:remember_token)) if remember_digest.nil?
	end

end
