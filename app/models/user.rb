class User < ApplicationRecord
	has_secure_password
 
	validates_uniqueness_of :username

	def fname_with_lname
		"#{fname} #{lname}"
	end

end
