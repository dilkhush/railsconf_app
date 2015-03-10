class SonosPlayerInterface
	MORNING_MUSIC = 'https://dl.dropboxusercontent.com/u/8101340/imprint.mp3'
	PARTY_MUSIC = 'https://dl.dropboxusercontent.com/u/8101340/Only%20Getting%20Younger.mp3'

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
end
