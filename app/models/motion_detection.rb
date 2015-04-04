class MotionDetection < ActiveRecord::Base
	belongs_to :motion_detector

	after_create :assign_to_motion_detector



	def assign_to_motion_detector
		motion_detector = MotionDetector.last

		motion_detector.motion_detections << self
		motion_detector.save
	end


	def self.motions_detected_hash
		[
			{x: (Date.today).to_s, value:self.all.select {|detection| detection.created_at.to_date == Date.today}.size},
			{x: (Date.today-1.days).to_s, value:self.all.select {|detection| detection.created_at.to_date == Date.today-2.days}.size},
			{x: (Date.today-2.days).to_s, value:self.all.select {|detection| detection.created_at.to_date == Date.today-3.days}.size},
			{x: (Date.today-3.days).to_s, value:self.all.select {|detection| detection.created_at.to_date == Date.today-4.days}.size},
			{x: (Date.today-4.days).to_s, value:self.all.select {|detection| detection.created_at.to_date == Date.today-5.days}.size},
			{x: (Date.today-5.days).to_s, value:self.all.select {|detection| detection.created_at.to_date == Date.today-6.days}.size}
		]
	end
end
