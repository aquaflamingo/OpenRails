class MessagesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_message, only: [:show,:edit,:destroy,:update]
    def index
        @messages = Message.all.order("created_at DESC")
    end

    def update
    end

    def show
    end

    def destroy
        @message.destroy
        redirect_to root_path
    end

    def edit

    end

    def update
        if @message.update(message_params)
            redirect_to message_path
        else
            render 'edit'
        end
    end
    
    def new 
        @message = current_user.messages.build
    end

    def create
        @message = current_user.messages.build(message_params)
        if @message.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    private
        def message_params
            params.require(:message).permit(:title,:description)
        end

        def find_message
            @message = Message.find(params[:id])
        end
end
