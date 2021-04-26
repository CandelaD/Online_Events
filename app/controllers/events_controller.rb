class EventsController < ApplicationController
    before_action :find_article, except: [:new, :create, :index]

    #GET events/index
    def index
        @events = Event.all
    end
    
    #GET events/new
    def new
        @event = Event.new
    end

    #GET events/:id
    def show
    end

    #GET events/:id/edit
    def edit
    end

    #PATCH events/:id
    def update
        @event = Event.update(title: params[:event][:title],
                              description: params[:event][:description])
        
        redirect_to @event
    end

    #POST /events
    def create
        @event = Event.create(title: params[:event][:title],
                              description: params[:event][:description]) 
        
        redirect_to @event
     end


    #DELETE /events/:id
    def destroy
        @event.destroy
        redirect_to root_path
    end

    def find_article
        @event = Event.find(params[:id])
    end

end
