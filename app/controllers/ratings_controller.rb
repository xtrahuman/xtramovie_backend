class RatingsController < ApplicationController
    before_action :authenticate_request!
  
    def index
        @ratings = Rating.all.order('created_at ASC')
        render json: { ratings: @ratings }
    end

    def movie_ratings
        movie_id= params[:movie_id]
        if movie_id
            @movie_rating = Rating.where(movie_id: movie_id).order('created_at DESC')
            @rating_count = @movie_rating.count
            rating_average = @movie_rating.average(:rate)
            render json: {rate_averag: rating_average,count: @rating_count, movie_ratings: @movie_rating }, status: :ok
        else
            render json: 'kindly provide movie id', status: :unprocessable_entity
        end
    end


    def create
        # rating = Rating.new(rating_param)
        #this below makes sure only signed user can rating
        rating = @current_user.ratings.new(rating_param)
        if rating.save
            render json: {message: 'rating created successfully!'}, status: :ok
        else
            render json: {error: 'rating can"t be created' }, status: :unprocessable_entity
        end
    end

    # DELETE ratings/:id
    # body user_id
    def destroy
        user_id = params.require(:user_id)
        rating = Rating.find_by(id: params.require(:id), user_id: user_id)
        if @current_user.admin?
            if rating.destroy
                render json: {message: 'user rating deleted successfully!'}, status: :ok
            else 
                render json: {error: 'error deleting rating'}, status: :unprocessable_entity
            end
        elsif user_id && @current_user.id == user_id.to_i
            if rating.destroy
                render json: {message: 'user rating deleted successfully!'}, status: :ok
            else 
                render json: {error: 'error deleting rating'}, status: :unprocessable_entity
            end
        else
            render json: {error: 'unauthorized'}, status: :unauthorized
        end
    end


    def rating_param
        params.permit(:movie_id, :rate)
    end
end
