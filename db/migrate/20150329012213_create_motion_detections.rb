class CreateMotionDetections < ActiveRecord::Migration
  def change
    create_table :motion_detections do |t|
      t.integer :motion_detector_id

      t.timestamps
    end
  end
end
