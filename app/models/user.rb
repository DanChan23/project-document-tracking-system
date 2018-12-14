class User < ApplicationRecord
	has_secure_password
 
	validates_uniqueness_of :username
	validates_presence_of :fname, :message => "^Please fill the First Name field!"
	validates :fname, length: { in: 2..30, too_short: "^First Name range should be between 2-30 characters", too_long: "^First Name range should be between 2-30 characters" }
	validates_presence_of :lname, :message => "^Please fill the Last Name field!"
	validates :lname, length: { in: 2..30, too_short: "^Last Name range should be between 2-30 characters", too_long: "^Last Name range should be between 2-30 characters" }
	validates :password, length: { in: 8..24, too_short: "^Your password is too short. Mininum password length is 8", too_long: "^Your password exceeds the allowable password length" }

	def fname_with_lname
		"#{fname} #{lname}"
	end

end
