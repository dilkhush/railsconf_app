class Api::V1::LightsController < ApplicationController
	# respond_to :json

	def create
		binding.pry
		params = light_params
		
		render status: 200
	end

	def update
	end

	def destroy
	end

	def index
		binding.pry
		light = LightSwitcher.new
		light.sunrise
	end

	private

	def light_params
		params.require(:light).permit(:event)
	end
end

