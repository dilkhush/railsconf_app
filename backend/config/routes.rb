Rails.application.routes.draw do

	
	
	
	# match "/websocket", to: WebsocketRails::ConnectionManager.new, via: [:get, :post]
  namespace :api do
      namespace :v1 do
        resources :lights, only: [:create]
        resources :beans, only: [:create]
        resources :sonos, only: [:create]
      end
  end

  

end
