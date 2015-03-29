class MotionDetection < ActiveRecord::Base
	belongs_to :motion_detector

	after_create :assign_to_motion_detector

	def destroy
		self.destroyed_at = DateTime.now
		self.save
	end

	private

	def assign_to_motion_detector
		motion_detector = MotionDetector.last

		motion_detector.motion_detections << self
		motion_detector.save
	end
end
