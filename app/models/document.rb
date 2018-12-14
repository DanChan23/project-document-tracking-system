class Document < ApplicationRecord

	validates_uniqueness_of :subject
	validates :subject, length: { in: 5..30, too_short: "^Subject name is too short", too_long: "^Subject name is too long" }
	
end
