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
        @event = Event.find(params[:id])
        @event = Event.update(title: params[:event][:title], description: params[:event][:description])
        
        redirect_to @event
    end

    #POST /events
    def create
        @event = Event.create(title: params[:event][:title]) 
        
        redirect_to @event
     end


    #DELETE /events/:id
    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to root_path
    end

end
