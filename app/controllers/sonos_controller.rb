class SonosController < WebsocketRails::BaseController

	def initialize_session
	    controller_store[:sonos_player] = SonosPlayerInterface.new
	end

	def create
		if message[:song] == "study"
			controller_store[:sonos_player].play_study_song
		elsif message[:song] == "party"
			controller_store[:sonos_player].play_party_song
		elsif message[:song] == "morning"
			controller_store[:sonos_player].play_morning_song
		end
	end

	def destroy
		controller_store[:sonos_player].pause
	end
	
end