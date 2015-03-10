class Api::V1::LightsController < ApplicationController
	before_action :light

	def create
		request = params[:event] if permitted_events.include?(params[:event])
		Thread.new {
			@light.send(request)
		}
		render nothing: true
	end
	

	private

	def permitted_events
		["create_party", "reset", "create_sunrise", "turn_off", "turn_on"]
	end

	def light
		@light = LightSwitcher.new

		if @light.light.off?
			@light.turn_on
		end
	end


end

