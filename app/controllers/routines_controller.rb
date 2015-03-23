class RoutinesController < WebsocketRails::BaseController

	def create_party
		controller_store[:light] = LifxInterface.new
		controller_store[:sonos_player] = SonosPlayerInterface.new

		controller_store[:sonos_player].play_party_song
		sleep 1
		controller_store[:light].party_lights
	end

	def destroy_party
		controller_store[:sonos_player].pause
		$stop_party = true
	end

	def morning

	end

	def motion_detector_alarm

	end

	def motion_detector_text

	end

	
end