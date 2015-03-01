class Arduino
	def initialize
		@arduino = ArduinoFirmata.connect
	end

	def turn_on(pin)
		@arduino.digital_write pin, true
	end

	def turn_off(pin)
		@arduino.digital_write pin, false
	end
	
end