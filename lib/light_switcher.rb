class LightSwitcher
	attr_reader :light

	def initialize
		client = LIFX::Client.lan
		lifx = client.discover!
		@light = lifx.lights.first
	end

	def turn_on
		light.turn_on!
	end

	def turn_off
		light.turn_off!
	end

	def set_blue
		light.set_color LIFX::Color.blue, duration: 0
	end

	def set_white
		light.set_color LIFX::Color.white, duration: 0
	end

	def set_red
		light.set_color LIFX::Color.red, duration: 0
	end

	def set_green
		light.set_color LIFX::Color.green, duration: 0
	end

	def set_interval(delay)
	    Thread.new do
	        loop do
	            sleep delay
	            yield
	        end
	    end
	end

	def set_rgb(r, g, b)
	    light.set_color(LIFX::Color.rgb(r, g, b), duration: 0)
	end

	def create_party
		count = 0
		party = loop do
			if count == 1
				party.kill
			end
			set_white
			sleep(0.5)
			set_red
			sleep(0.5)
			set_green
			sleep(0.5)
			set_blue
			sleep(0.5)
		end
	end

	def create_sunrise
		fade_time = 30 # time in seconds
		interval = 6 # run every 6 seconds
		increment = fade_time/interval
		luminence = 0.01
		luminence_increment = 1/increment.to_f
		hue_increment = 60/increment # Fade from red to bright yellow 0 to 60
		hue = hue_increment

		set_rgb(0,0,0)

		sunrise = set_interval(interval) do
		    if luminence >= 1
		        sunrise.kill
		    end

		    light.set_color(LIFX::Color.hsl(hue, 1, luminence), duration: interval)
		    luminence = luminence + luminence_increment
		    hue = hue + hue_increment
		end

		sunrise.join
	end
end