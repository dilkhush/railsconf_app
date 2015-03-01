class Api::V1::LightsController < ApplicationController
	before_action :connect_to_light

	def create
		@light.turn_on
		if params[:light][:event] == "sunrise"
			@light.create_sunrise
		elsif params[:light][:event] == "party"
			@light.create_party
		elsif params[:light][:event] == "reset"
			@light.set_white
		end
		render nothing: true
	end

	def destroy
		@light.turn_off
		render nothing: true
	end

	private

	def connect_to_light
		@light = LightSwitcher.new
	end
end

