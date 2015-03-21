class MotionDetectorController < WebsocketRails::BaseController

	def create
		controller_store[:motion_detector] = MotionDetectorInterface.new
		controller_store[:motion_detector].start_motion_detector
	end

	# def show

	# 	send_message(:motion_detected, status: true)
	# end

	def destroy
		controller_store[:motion_detector].stop_motion_detector
	end

end

