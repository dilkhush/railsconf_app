desc "Create Sunrise"
task :sunrise => :environment do 
	light = LightSwitcher.new

	if light.light.off?
		light.turn_on
	end

	light.create_sunrise
end

desc "Create Party"
task :party => :environment do 
	light = LightSwitcher.new

	if light.light.off?
		light.turn_on
	end

	light.create_party
end

desc "Reset light"
task :reset => :environment do 
	light = LightSwitcher.new

	if light.light.off?
		light.turn_on
	end
	sleep(0.3)
	light.set_white
end