class MotionDetector < ActiveRecord::Base
	has_many :motion_detections

	def destroy
		self.destroyed_at = DateTime.now
		self.save
	end
	
end
