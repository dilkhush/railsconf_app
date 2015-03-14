WebsocketRails::EventMap.describe do
  # You can use this file to map incoming events to controller actions.
  # One event can be mapped to any number of controller actions. The
  # actions will be executed in the order they were subscribed.
  #
  # Uncomment and edit the next line to handle the client connected event:
  #   subscribe :client_connected, :to => Controller, :with_method => :method_name
  #
  # Here is an example of mapping namespaced events:
  #   namespace :product do
  #     subscribe :new, :to => ProductController, :with_method => :new_product
  #   end
  # The above will handle an event triggered on the client like `product.new`.

  # Coffee
  subscribe :make_coffee, 'api/v1/coffees#create'
  subscribe :stop_coffee, 'api/v1/coffees#destroy'

  # Lights
  subscribe :turn_light_on, 'api/v1/lights#create'
  subscribe :turn_light_off, 'api/v1/lights#destroy'
  subscribe :change_color, 'api/v1/lights#change_color'
  subscribe :change_brightness, 'api/v1/lights#change_brightness'
end
