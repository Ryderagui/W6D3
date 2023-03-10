class CommentsController < ApplicationController


    def create
        input = Comment.new(comment_params)
        if input.save!
            render json: input
        else
            render json: ["Comment couldn't be created"], status: :unprocessable_entity
        end

    end

    def destroy
        input = Comment.find_by(id: params[:id])
        input.destroy
        render json: input
    end

    def index
        author_input = comment_params[:author_id]
        artwork_input = comment_params[:artwork_id]
        

        if author_input != nil
            comments = Comment.where("author_id = #{author_input}")
            return render json: comments
        elsif artwork_input != nil
            opinions = Comment.where("artwork_id = #{artwork_input}")
            return render json: opinions
        else
            return render json: ["No comments found"], status: :not_found
        end

    end

    private

    def comment_params
        params.require(:comments).permit(:body, :author_id, :artwork_id)
    end
end