class CoffeeMakerController < WebsocketRails::BaseController

  def create
    controller_store[:coffee_maker] = CoffeeMakerInterface.new
    controller_store[:coffee_maker].start_coffee_maker
    controller_store[:coffee_maker_model] = CoffeeMaker.create
  end

  def destroy
    controller_store[:coffee_maker].stop_coffee_maker
    controller_store[:coffee_maker_model].destroy
  end

end
