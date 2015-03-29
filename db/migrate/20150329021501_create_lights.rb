class CreateLights < ActiveRecord::Migration
  def change
    create_table :lights do |t|
      t.datetime :destroyed_at

      t.timestamps
    end
  end
end
