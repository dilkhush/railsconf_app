class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.datetime :destroyed_at

      t.timestamps
    end
  end
end
