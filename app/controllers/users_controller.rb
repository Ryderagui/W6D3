class UsersController < ApplicationController

    def index
        input = User.all
        
        render json: input


    end
    
    def show 
        input = User.find(params["id"])
        render json: input
    end

    def create 
        user = User.new(params.require(:user).permit(:name,:email))
        # { user: { name: alksjdak email: ahsdkjalkjf}}
        if user.save!
            render json: user
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end

        def update
        input = User.find_by(id: params[:id])
        redirect_to user_url(user.id)
        end
    end




end
