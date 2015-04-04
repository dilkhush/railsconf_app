class AddDestroyedAtToMotionDetections < ActiveRecord::Migration
  def change
    add_column :motion_detections, :destroyed_at, :datetime
  end
end
