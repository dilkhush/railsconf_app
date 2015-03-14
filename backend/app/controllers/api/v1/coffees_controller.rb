class Api::V1::CoffeesController < WebsocketRails::BaseController
  
  def create
  	controller_store[:coffee_maker] = CoffeeMakerInterface.new
    controller_store[:coffee_maker].start_coffee_maker
  end

  def destroy
    controller_store[:coffee_maker].stop_coffee_maker
  end

end
