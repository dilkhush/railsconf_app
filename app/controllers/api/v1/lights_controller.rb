class Api::V1::LightsController < ApplicationController
	# before_action :connect_to_light

	def create
		request = params[:event] if permitted_events.include?(params[:event])
		run_rake(request)
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
end

