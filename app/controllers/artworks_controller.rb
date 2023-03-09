class ArtworksController < ApplicationController
    # index, show, create, update, destroy


    def index
        input = Artwork.artworks_for_user_id(params[:user_id])
        render json: input
    end

    def show
        input = Artwork.find(params[:id])

        if input 
            render json: input
        else 
            render json: input.errors.full_messages, status: :not_found
        end
    end

    def update
        input = Artwork.find_by(id: params[:id])

        if input && input.update(art_params)
            redirect_to artwork_url(input.id)
        else
            render json: ["Failed Update"], status: :unprocessable_entity
        end
    end

    def create 
        input = Artwork.new(art_params)

        if input.save!
            redirect_to artworks_url
        else
            render json: "Create failed"
        end
    end

    def destroy 
        input = Artwork.find_by(id: params[:id])
        input.destroy  
        render json: input
    end
        
            



    private
    def art_params
        params.require(:artwork).permit(:title,:image_url,:artist_id)
    end

end