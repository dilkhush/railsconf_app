class MotionDetectorController < WebsocketRails::BaseController

	def create
		controller_store[:motion_detector] = MotionDetectorInterface.new
		controller_store[:motion_detector].start_motion_detector
		controller_store[:motion_detector_model] = MotionDetector.create
	end

	def destroy
		controller_store[:motion_detector].stop_motion_detector
		controller_store[:motion_detector_model].destroy
	end

end

