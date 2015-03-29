class MotionDetection < ActiveRecord::Base
	belongs_to :motion_detector

	def destroy
		self.destroyed_at = DateTime.now
		self.save
	end
end
