class CreateMotionDetectors < ActiveRecord::Migration
  def change
    create_table :motion_detectors do |t|
      t.datetime :destroyed_at

      t.timestamps
    end
  end
end
