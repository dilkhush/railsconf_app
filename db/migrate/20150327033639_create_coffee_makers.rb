class CreateCoffeeMakers < ActiveRecord::Migration
  def change
    create_table :coffee_makers do |t|
      t.datetime :destroyed_at

      t.timestamps
    end
  end
end
