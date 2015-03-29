class ChangeValueFieldInBrightnessToFloat < ActiveRecord::Migration
  def change
  	change_column :brightnesses, :value, :float
  end
end
