class EventsController < ApplicationController
    
    #GET events/new
    def new
        @event = Event.new
    end

    #GET events/:id
    def show
        @event = Event.find(params[:id])
    end

    #GET events/:id/edit
    def edit
        @event = Event.find(params[:id])
        puts
    end

    #PATCH events/:id
    def update
        @event = Event.update(title: params[:event][:title], description: params[:event][:description])
        
        redirect_to @event
    end

    #POST /events
    def create
        @event = Event.new(title: params[:event][:title],
                              description: params[:event][:description]) 
        
        render json: @event
     end

end
