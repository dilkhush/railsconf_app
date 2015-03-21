class MotionDetectorInterface
	
	def initialize
		Thread.abort_on_exception = true
	end

	def start_motion_detector
		Thread.new do
			# Connect to Arduino
			arduino = ArduinoFirmata.connect
			# "/dev/tty.usbmodem1451"
			@connected_arduino = arduino
			
			# Declare Pin 7 on the Arduino as an input pin
			arduino.pin_mode 7, ArduinoFirmata::INPUT



			# Read the digital pins
			arduino.on :digital_read do |pin, status|
				# What to do if there is motion
				if pin == 7 && status == true
					WebsocketRails[:motion_detector].trigger 'status', {status: "Motion has been detected"}
					`say motion detected`
			    	arduino.digital_write 13, true
				end

				# What to do if there is no motion
				if pin == 7 && status == false
					WebsocketRails[:motion_detector].trigger 'status', {status: "No motion currently detected"}
			      	arduino.digital_write 13, false
			    end
			end
		end
	end


	def stop_motion_detector
		self.connected_arduino.close

		# Thread.list.each do |thread|
		# 	thread.kill if thread.status == "sleep"
		# end
	end

	def connected_arduino
		@connected_arduino
	end

end