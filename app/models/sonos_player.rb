class SonosPlayer < ActiveRecord::Base

	def destroy
		self.destroyed_at = DateTime.now
		self.save
	end
	
end
