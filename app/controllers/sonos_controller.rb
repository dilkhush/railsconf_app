class SonosController < WebsocketRails::BaseController

	def initialize_session
	    controller_store[:sonos_player_interface] = SonosPlayerInterface.new
	end

	def create
		requested_playlist = message[:song]

		sonos_player_interface = controller_store[:sonos_player_interface]
		
		case requested_playlist
			when "study"
			sonos_player_interface.play_study_song
		 	when "party"
			sonos_player_interface.play_party_song
			when "morning"
			sonos_player_interface.play_morning_song
		end

		controller_store[:sonos_player_model] = SonosPlayer.create
		sonos_player_model = controller_store[:sonos_player_model]

		sonos_player_model.playlist = requested_playlist.capitalize
		sonos_player_model.save
	end

	def destroy
		controller_store[:sonos_player_interface].pause
		controller_store[:sonos_player_model].destroy
	end
	
end