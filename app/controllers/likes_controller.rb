# frozen_string_literal: true

class LikesController < ApplicationController
  def index
    @likes = Like.all
    render json: { likes: @likes }
  end

  def movie_like
    movie_id= params[:movie_id]
    @movie_like = Like.where(movie_id: movie_id)
    @like_count = @movie_like.count
    render json: {count: @like_count, movie_like: @movie_like }, status: :ok
  end

  def show
    @movie_like = Like.find(params[:id])
  end

  def create
    @like = Like.find_by(likes_param)
    if @like
       @like.destroy
       render json: 'Likes deleted successfully!'.to_json, status: :ok
    else
        like = Like.new(likes_param)
      if like.save
        render json: 'Likes created successfully!'.to_json, status: :ok
      else
        render json: 'likes cant be created'.to_json, status: :unprocessable_entity
      end
    end
  end

  private

  def movie_param
    params.permit(:movie_id)
  end

  def likes_param
    params.permit(:user_id, :movie_id)
  end
end
