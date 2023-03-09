class UsersController < ApplicationController

    def index
        input = User.all
        
        render json: input


    end
    
    def show 
        render json: params
    end

    def create 
        user = User.new(params.require(:user).permit(:name,:email))
        # { user: { name: alksjdak email: ahsdkjalkjf}}
        if user.save!
            render json: user
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end




end
