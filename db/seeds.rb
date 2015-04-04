# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


motion_detector1 = MotionDetector.create


def create_objects(number_of_times, object, days_ago)
	number_of_times.times do
		object.create.tap do |o|
			o.created_at = DateTime.now - days_ago
			o.save
		end
	end
end


create_objects(1, MotionDetection, 6.days)
create_objects(7, MotionDetection, 5.days)
create_objects(4, MotionDetection, 4.days)
create_objects(5, MotionDetection, 3.days)
create_objects(2, MotionDetection, 2.days)

# MotionDetection.all.select {|detection| detection.created_at.to_date == Date.today-1}.size