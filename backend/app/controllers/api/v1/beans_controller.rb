class Api::V1::BeansController < ApplicationController
  def create
  	request = params[:beans]
  	arduino = Arduino.new	
  	Thread.new{
  		if request == "on"
  			arduino.turn_on(10)
	  	elsif request == "off"
	  		arduino.turn_off(10)	
	  	end
  	}
  end
end
