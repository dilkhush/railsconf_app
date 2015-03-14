class CoffeeMakerInterface
	
	def initialize
		@arduino = ArduinoFirmata.connect
	end

	def start_coffee_maker
		@arduino.digital_write 12, true
		@arduino.digital_write 13, true
	end

	def stop_coffee_maker
		@arduino.digital_write 12, false
		@arduino.digital_write 13, false
		@arduino.close
	end

end