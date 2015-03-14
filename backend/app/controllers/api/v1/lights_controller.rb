class Api::V1::LightsController < WebsocketRails::BaseController

	def initialize_session
	    controller_store[:light] = LifxInterface.new
	end

	def create
		controller_store[:light].turn_on
	end

	def destroy
		controller_store[:light].turn_off
	end

	def change_color
		red = message[:red]
		green = message[:green]
		blue = message[:blue]

		controller_store[:light].set_rgb(red, green, blue)
	end

end

