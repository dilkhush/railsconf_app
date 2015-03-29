class SonosPlayerInterface
	STUDY_MUSIC = 'https://dl.dropboxusercontent.com/u/8101340/imprint.mp3'
	MORNING_MUSIC = 'https://dl.dropboxusercontent.com/u/8101340/canon_in_d.mp3'
	PARTY_MUSIC = 'https://dl.dropboxusercontent.com/u/8101340/Party%20Rock%20Editted.mp3'
	ALARM = 'https://dl.dropboxusercontent.com/u/8101340/Door_entry_notification-Loge_the_60th-95203129.mp3'

	attr_accessor :speaker

	def initialize
		system = Sonos::System.new
		@speaker = system.speakers.first
	end

	def load(file)
		@speaker.play(file)
	end

	def play
		@speaker.play
	end

	def pause
		@speaker.pause
	end

	def play_morning_song
		load(MORNING_MUSIC)
		play
	end

	def play_party_song
		load(PARTY_MUSIC)
		play
	end

	def play_study_song
		load(STUDY_MUSIC)
		play
	end

	def play_alarm
		load(ALARM)
		play
	end
end
