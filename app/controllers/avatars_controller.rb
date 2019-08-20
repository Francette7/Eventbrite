class AvatarsController < ApplicationController
	before_action :authenticate_user!, except: [:create]
  def create
  	@event = Event.find(params[:event_id])
  	@event.avatar.attach(params[:avatar])
  	redirect_to(event_avatars_path(@event))
  end
end
