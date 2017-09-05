class Type < ApplicationRecord
	has_many :items

	def self.create_type(type_name)
		t = Type.new 	
		t.type_name = type_name
		t.save!
	end

end
