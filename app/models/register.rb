class Register < ActiveRecord::Base
	attr_accessor :password, :password_confirmation
	def self.authenticate(email, password_hash)

    register = find_by_password_hash(password_hash) && find_by_email(email)
    
  end
end
