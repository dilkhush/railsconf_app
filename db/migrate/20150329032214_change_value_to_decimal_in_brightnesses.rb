class ChangeValueToDecimalInBrightnesses < ActiveRecord::Migration
  def change
  	change_column :brightnesses, :value, :decimal, :precision=>1, :scale => 2
  end
end
