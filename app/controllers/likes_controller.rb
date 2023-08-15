# frozen_string_literal: true

class LikesController < ApplicationController
    before_action :authenticate_request!
  def index
    @likes = @current_user.likes.all
    render json: { likes: @likes }
  end

  def movie_likes
    movie_id= params[:movie_id]
    if movie_id
        @movie_like = Like.where(movie_id: movie_id)
        @like_count = @movie_like.count
        render json: {count: @like_count, movie_likes: @movie_like }, status: :ok
    else
        render json: 'kindly provide movie id', status: :unprocessable_entity
    end
  end

#   def show
#     @movie_like = Like.find(params[:id])
#   end

  def create
    @like = Like.find_by(user_id: params[:user_id], movie_id: params[:movie_id])
    if @like
       @like.destroy
       render json: 'like deleted successfully!'.to_json, status: :ok
    else
        like = Like.new(likes_param)
      if like.save
        render json: 'like created successfully!'.to_json, status: :ok
      else
        render json: 'like can"t be created'.to_json, status: :unprocessable_entity
      end
    end
  end

  private

  def likes_param
    params.permit(:user_id, :movie_id)
  end
end
