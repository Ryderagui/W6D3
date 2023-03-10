class LikesController < ApplicationController

    def index
        input = Like.all
        render json: input
    end

    def create
        input = Like.new(like_params)
        input.save!
        render json: input
    end

    def destroy
        input = Like.find_by(id: params[:id])
        input.destroy
        render json: input
    end

    private

    def like_params
        params.require(:likes).permit(:likeable_type, :likable_id, :author_id)
    end

end