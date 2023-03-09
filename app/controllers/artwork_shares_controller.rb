class ArtworkSharesController < ApplicationController

    def create
        input = ArtworkShare.new(art_share_params)

        if input.save!
            render json: input
        else
            render ["Share Failed"], status: :unprocessable_entity
        end
    end

    def destroy
        input = ArtworkShare.find_by(id: params[:id])
        input.destroy
        render json: input
    end


    private
    def art_share_params
        params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
    end

end