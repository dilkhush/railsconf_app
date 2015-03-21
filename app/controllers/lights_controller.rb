class LightsController < WebsocketRails::BaseController
	
	def initialize_session
	    controller_store[:light] = LifxInterface.new
	end

	def show
		send_message(:light_status, status: controller_store[:light].on?)
	end

	def create
		controller_store[:light].turn_on
	end

	def update
		# params look like this: {color: {red: 'integer', green: 'integer', blue: 'integer'}, brightness: 'integer'}
		if message[:color]
			red = message[:color][:red]
			green = message[:color][:green]
			blue = message[:color][:blue]

			controller_store[:light].set_rgb(red, green, blue)
		elsif message[:brightness]
			brightness = message[:brightness]

			controller_store[:light].change_brightness(brightness)
		end
	end

	def destroy
		controller_store[:light].turn_off
	end

end

