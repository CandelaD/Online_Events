class EventsController < ApplicationController
    before_action :find_article, except: [:new, :create, :index, :host]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :attend]

    #GET events/index
    def index
        @events = Event.all
    end
    
    #GET events/new
    def new
        @event = Event.new
    end

    #POST /events
    def create
        @event = current_user.events.create(event_params)
        
        redirect_to @event, notice: 'Event was successfully created.'
     end

    #GET events/:id
    def show
    end

    #GET events/:id/edit
    def edit
    end

    #PATCH events/:id
    def update
        if @event.update(event_params)
			redirect_to @event, notice: "Your event was updated successfully"
		else
			render 'new'
		end
    end

    #DELETE /events/:id
    def destroy
        @event.destroy
        flash[:alert] = 'Your event was DELETED successfully.'
        redirect_to root_path
    end

 
    #GET /events/user/:user_id
    def host
        @host = User.find(params[:user_id])
    end

    #GET /events/:id/attends
    def attend
        @event.users << current_user
        @event.save
    end

  private

    def find_article
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:title, :description, :event_date, :event_time, :host)
    end

end
