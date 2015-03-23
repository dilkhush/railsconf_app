class LifxInterface
	attr_reader :light, :client

	def initialize
		@client = LIFX::Client.lan
		lifx = @client.discover!
		@light = lifx.lights.first
	end

	def stop_client
		@client.stop
	end	

	def turn_on
		light.turn_on!	
	end

	def turn_off
		light.turn_off!
	end

	def change_brightness(brightness)
		light.set_color(light.color.with_brightness(brightness))
	end

	def set_rgb(r, g, b)
	    light.set_color(LIFX::Color.rgb(r, g, b), duration: 0)
	end

	def on?
		light.on?
	end


	def party_lights
		$stop_party = false
		Thread.new do
			until $stop_party == true
				random_color  = LIFX::Color.random_color(saturation: 0.5)
				@light.set_color(random_color, duration: 0)
				sleep (60/128.to_f)
			end
		end
	end

	# def create_party
	# 	count = 0
	# 	loop do
	# 		if count == 2
	# 			break
	# 		end
	# 		set_white
	# 		sleep(0.5)
	# 		set_red
	# 		sleep(0.5)
	# 		set_green
	# 		sleep(0.5)
	# 		set_blue
	# 		sleep(0.5)
	# 		count += 1
	# 	end
	# end

	# def create_sunrise
	# 	fade_time = 30 # time in seconds
	# 	interval = 6 # run every 6 seconds
	# 	increment = fade_time/interval
	# 	luminence = 0.01
	# 	luminence_increment = 1/increment.to_f
	# 	hue_increment = 60/increment # Fade from red to bright yellow 0 to 60
	# 	hue = hue_increment

	# 	set_rgb(0,0,0)

	# 	sunrise = set_interval(interval) do
	# 	    if luminence >= 1
	# 	        sunrise.kill
	# 	    end

	# 	    light.set_color(LIFX::Color.hsl(hue, 1, luminence), duration: interval)
	# 	    luminence = luminence + luminence_increment
	# 	    hue = hue + hue_increment
	# 	end

	# 	sunrise.join
	# end


end