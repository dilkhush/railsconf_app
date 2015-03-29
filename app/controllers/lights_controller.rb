class LightsController < WebsocketRails::BaseController
	
	def initialize_session
	    controller_store[:light_interface] = LifxInterface.new
	end

	def show
		send_message(:light_status, status: controller_store[:light_interface].on?)
	end

	def create
		controller_store[:light_interface].turn_on
		controller_store[:light_model] = Light.create
	end

	def update
		# params look like this: {color: {red: 'integer', green: 'integer', blue: 'integer'}, brightness: 'integer'}
		rgb_value_params = message[:color]
		brightness_params = message[:brightness]

		light = controller_store[:light_model]

		if rgb_value_params
			red = rgb_value_params[:red]
			green = rgb_value_params[:green]
			blue = rgb_value_params[:blue]

			controller_store[:light_interface].set_rgb(red, green, blue)

			light.colors.build(red: red, green: green, blue: blue)

		elsif brightness_params
			brightness = brightness_params

			controller_store[:light_interface].change_brightness(brightness)

			light.brightnesses.build(value: brightness)

		end
		light.save
	end

	def destroy
		controller_store[:light_interface].turn_off
		controller_store[:light_model].destroy
	end

end

