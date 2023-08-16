# frozen_string_literal: true

class LikesController < ApplicationController
    before_action :authenticate_request!

  # GET /likes
  def index
    @likes = @current_user.likes.all.order('created_at DESC')
    render json: { likes: @likes }
  end

  # GET /movie_likes
  # Body movie_id

  def movie_likes
    movie_id= params[:movie_id]
    if movie_id
        @movie_like = Like.where(movie_id: movie_id).order('created_at DESC')
        @like_count = @movie_like.count
        render json: {count: @like_count, movie_likes: @movie_like }, status: :ok
    else
        render json: 'kindly provide movie id', status: :unprocessable_entity
    end
  end

#   def show
#     @movie_like = Like.find(params[:id])
#   end

  # post /likes
  # body movie_id

  def create
    @like = @current_user.likes.find_by(movie_id: params[:movie_id])
    if @like
       @like.destroy
       render json: 'like deleted successfully!'.to_json, status: :ok
    else
        like = @current_user.likes.new(likes_param)
      if like.save
        render json: 'like created successfully!'.to_json, status: :ok
      else
        render json: 'like can"t be created'.to_json, status: :unprocessable_entity
      end
    end
  end

  private

  def likes_param
    params.permit(:movie_id)
  end
end
