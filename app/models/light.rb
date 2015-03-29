class Light < ActiveRecord::Base
	has_many :brightnesses
	has_many :colors

	def destroy
		self.destroyed_at = DateTime.now
		self.save
	end
	
end
