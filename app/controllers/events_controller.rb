class EventsController < ApplicationController
    def new
        @event = Event.new
    end

    def show
        @event = Event.find(params[:id])
    end

    def edit
        @event = Event.find(params[:id])
        puts
    end

    def update
        @event = Event.update(title: params[:event][:title], description: params[:event][:description])
        
        redirect_to @event
    end

    def create
        @event = Event.create(title: params[:event][:title], description: params[:event][:description])
        render json: @event
    end


end
