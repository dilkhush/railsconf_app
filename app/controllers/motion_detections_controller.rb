class MotionDetectionsController < WebsocketRails::BaseController

	def index
		send_message(:motions_detected, MotionDetection.motions_detected_hash)
	end

end

