class EventsController < ApplicationController
  def index
  	@event = Event.all
  end
  def new
  	@event = Event.new
  end
  def create
  	@event = Event.create(start_date:params[:start_date], 
  							duration:params[:duration], 
  							title:params[:title], 
  							event_description:params[:event_description], 
  							price:params[:price],
  							location:params[:location])
    if @event.save
      flash[:success] = " 😇 Félicitation! vous venez de créer un nouveau Evénement! 👌"
        redirect_to 'root_path'
    else
    flash[:failed] = "🤔 Attention!!! un des champs n'est pas valide. 🤓 Veuillez réessayer svp!"
        render '/events/new'
    end
  end

  def show
  	@event = Event.find(params[:id])
  end
end
