class Api::V1::LightsController < ApplicationController
	before_action :create_sonos_player
	before_action :set_request

	def create
		@sonos_instance.send(@request)
	end
	

	private

	def create_sonos_player
		@sonos_instance = SonosPlayer.new
	end

	def permitted_params
		[]
	end

	def set_request
		@request = params[:event] if permitted_params.include?(params[:event])
	end

end