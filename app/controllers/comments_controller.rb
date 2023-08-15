class CommentsController < ApplicationController
    before_action :authenticate_request!

    def index
        @comment = Comment.all
        render json: { comments: @comment }
    end

    def movie_comments
        movie_id= params[:movie_id]
        if movie_id
            @movie_comment = Comment.where(movie_id: movie_id)
            @comment_count = @movie_comment.count
            render json: {count: @comment_count, movie_comments: @movie_comment  }, status: :ok
        else
            render json: {message: 'kindly provide movie id'}, status: :unprocessable_entity
        end
    end

    def create
        # comment = Comment.new(comment_param)
        #this below makes sure only signed user can comment
        comment = @current_user.comments.new(comment_param)
        if comment.save
            render json: {message: 'comment created successfully!'}, status: :ok
        else
            render json: {error: 'comment can"t be created' }, status: :unprocessable_entity
        end
    end

    #comments/:id
    def destroy
        user_id = params.require(:user_id)
        comment = Comment.find_by(id: params.require(:id), user_id: user_id)
        if @current_user.admin?
            if comment.destroy
                render json: {message: 'user comment deleted successfully!'}, status: :ok
            else 
                render json: {error: 'error deleting comment'}, status: :unprocessable_entity
            end
        elsif @current_user.id == user_id.to_i
            if comment.destroy
                render json: {message: 'user comment deleted successfully!'}, status: :ok
            else 
                render json: {error: 'error deleting comment'}, status: :unprocessable_entity
            end
        end
    end

    private
    def comment_param
      # if using Comment.new(comment_param) to create :user_id should be included below
      params.permit(:movie_id, :comment)
    end

end