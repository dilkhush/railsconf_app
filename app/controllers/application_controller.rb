class ApplicationController < ActionController::API

	def run_rake(task)
		system "rake #{task} &"
	end
end
