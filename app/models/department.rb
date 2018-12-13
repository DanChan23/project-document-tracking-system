class Department < ApplicationRecord

	def fname_with_lname
		"#{fname} #{lname}"
	end
	
end
