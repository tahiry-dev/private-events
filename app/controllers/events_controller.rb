class EventsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]

  def index
    @events = Event.all
    @previous_events = Event.past
    @upcoming_events = Event.future
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = 'Your event Has been created'
      redirect_to @event
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
