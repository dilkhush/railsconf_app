class FixDecimalPrecision < ActiveRecord::Migration
  def change
  	change_column :brightnesses, :value, :decimal, :precision=>3, :scale => 2
  end
end
