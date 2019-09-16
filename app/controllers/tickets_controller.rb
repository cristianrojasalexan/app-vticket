class TicketsController < ApplicationController
    layout "home"
    include HomeHelper

    def new
        @ticket = Ticket.new
        @user = get_username(current_user.id)
        @users = User.where(admin: false)
    end

    def mytickets
        @tickets = Ticket.where(user_id: current_user.id)
        @user = get_username(current_user.id)
        @users = User.where(admin: false)
    end

    def create
        @ticket = Ticket.new(ticket_params)  
        puts ticket_params  
          if @ticket.save
            redirect_to "/tickets/list"
          else
            render :new
          end
    end
    
    def edit
        @ticket = Ticket.find(params[:id])
        @user = get_username(current_user.id)
        @users = User.where(admin: false)
    end

    def myticketedit
        @ticket = Ticket.find(params[:id])
        @user = get_username(current_user.id)
        @users = User.where(admin: false)
    end
    
    def myticketupdate
        @ticket = Ticket.find(params[:id])
        if @ticket.update(ticket_params)
            redirect_to tickets_mytickets_path
        else
            render :edit
        end
    end

    def update
        @ticket = Ticket.find(params[:id])
        if @ticket.update(ticket_params)
            redirect_to tickets_list_path
        else
            render :edit
        end
    end

    def list
        if user_signed_in? and current_user.admin?
            @tickets = Ticket.all
            @user = get_username(current_user.id)  
        else
            redirect_to "/home/index"
        end
    end

    def destroy
        @ticket = Ticket.find(params[:id])
        @ticket.destroy
        redirect_to tickets_list_path
      end
    
      private
        def ticket_params
          params.require(:ticket).permit(:title, :description, :priority, :status, :user_id)
        end
end
