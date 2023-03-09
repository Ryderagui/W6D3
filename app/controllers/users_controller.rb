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
        user = User.new(user_params)
        # { user: { name: alksjdak email: ahsdkjalkjf}}
        if user.save!
            render json: user
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end

        
    end

    def update
            
        input = User.find_by(id: params[:id])
        if input && input.update(user_params)
            redirect_to user_url(input.id)
            # render json: params
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end

    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
        redirect_to users_url

    end

    private

    def user_params
        params.require(:user).permit(:name)
    end

end
