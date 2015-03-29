WebsocketRails::EventMap.describe do

  # namespace :lights do
  #   subscribe :show, 'lights#show' #triggered on client side with lights.show
  #   subscribe :create, 'lights#create' #triggered on client side with lights.create
  #   subscribe :update, 'lights#update' #triggered on client side with lights.update
  #   subscribe :destroy, 'lights#destroy' #triggered on client side with lights.destroy
  # end

  namespace :lights do
    subscribe :show, :to => LightsController, :with_method => :show #triggered on client side with lights.show
    subscribe :create, :to => LightsController, :with_method => :create #triggered on client side with lights.create
    subscribe :update, :to => LightsController, :with_method => :update #triggered on client side with lights.update
    subscribe :destroy, :to => LightsController, :with_method => :destroy #triggered on client side with lights.destroy
  end

  namespace :coffee_maker do
    subscribe :create, 'coffee_maker#create' #triggered on client side with coffee_maker.create
    subscribe :destroy, 'coffee_maker#destroy' #triggered on client side with coffee_maker.destroy
  end

  namespace :sonos do
    subscribe :create, 'sonos#create' #triggered on client side with sonos.create
    subscribe :destroy, 'sonos#destroy' #triggered on client side with sonos.destroy
  end

  namespace :motion_detector do
    subscribe :create, :to => MotionDetectorController, :with_method => :create #triggered on client side with motion_detector.create
    subscribe :destroy, :to => MotionDetectorController, :with_method => :destroy #triggered on client side with motion_detector.destroy
  end

  namespace :routines do
    subscribe :party_start, 'routines#create_party' #triggered on client side with routines.party_start
    subscribe :party_stop, 'routines#destroy_party' #triggered on client side with routines.party_stop
    
    subscribe :morning, 'routines#morning' #triggered on client side with routines.morning
    subscribe :create_motion_detector_alarm, 'routines#create_motion_detector_alarm' #triggered on client side with routines.create_motion_detector_alarm
    subscribe :destroy_motion_detector_alarm, 'routines#destroy_motion_detector_alarm' #triggered on client side with routines.destroy_motion_detector_alarm
    subscribe :motion_detector_text, 'routines#motion_detector_alarm' #triggered on client side with routines.motion_detector_text
  end

end


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

  # subscribe :make_coffee, 'api/v1/coffee#create'
  # subscribe :stop_coffee, 'api/v1/coffee#destroy'

  # Lights
  # subscribe :turn_light_on, 'api/v1/lights#create'
  # subscribe :turn_light_off, 'api/v1/lights#destroy'
  # subscribe :change_color, 'api/v1/lights#change_color'
  # subscribe :change_brightness, 'api/v1/lights#change_brightness'
  # subscribe :check_status, 'api/v1/lights#check_status'

  # Sonos
  # subscribe :sonos_create, 'api/v1/sonos#create'
  # subscribe :sonos_destroy, 'api/v1/sonos#destroy'
