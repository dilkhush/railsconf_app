class CreateBrightnesses < ActiveRecord::Migration
  def change
    create_table :brightnesses do |t|
      t.integer :value
      t.integer :light_id

      t.timestamps
    end
  end
end
