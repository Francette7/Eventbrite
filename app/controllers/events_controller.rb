class EventsController < ApplicationController
before_action :authenticate_user!, except: [:index]
  def index
  	@event = Event.all
  end
  def new
  	@event = Event.new
  end
  def create
  	@event = Event.new(event_params)
    @event.admin_id = current_user.id
    if @event.save
      flash[:success] = " 😇 Félicitation! vous venez de créer un nouveau Evénement! 👌"
        redirect_to root_path
    else
    flash[:failed] = "🤔 Attention!!! un des champs n'est pas valide. 🤓 Veuillez réessayer svp!"
        render 'new'
    end
  end

  def show
  	@event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:start_date, 
                :duration, 
                :title, 
                :event_description, 
                :price,
                :location)
  end
end
