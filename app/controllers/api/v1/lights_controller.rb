class Api::V1::LightsController < ApplicationController
	before_action :connect_to_light

	def create
		request = params[:event] if permitted_events.include?(params[:event])

		Thread.new {
			if request == "sunrise"
				@light.create_sunrise
			elsif request == "reset"
				@light.set_white
			elsif request == "party"
				@light.create_party
			end	
		}
		render nothing: true
	end

	def destroy
		@light.turn_off
		render nothing: true
	end

	private

	def permitted_events
		["party", "sunrise", "reset"]
	end

	def connect_to_light
		@light = LightSwitcher.new

		if @light.light.off?
			@light.turn_on
		end
	end


end

