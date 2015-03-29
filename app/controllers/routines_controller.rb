class RoutinesController < WebsocketRails::BaseController

	def create_party
		controller_store[:light] = LifxInterface.new
		controller_store[:sonos_player] = SonosPlayerInterface.new

		controller_store[:sonos_player].play_party_song
		controller_store[:light].party_lights

		controller_store[:party_model] = Party.create
	end

	def destroy_party
		controller_store[:sonos_player].pause
		$stop_party = true

		controller_store[:party_model].destroy
	end

	def morning

	end

	def create_motion_detector_alarm
		controller_store[:motion_detector] = MotionDetectorInterface.new("alarm")
		controller_store[:motion_detector_model] = MotionDetector.create

		controller_store[:motion_detector].start_motion_detector
	end

	def destroy_motion_detector_alarm
		controller_store[:motion_detector].stop_motion_detector
		controller_store[:motion_detector_model].destroy
	end

	def motion_detector_text

	end

	
end