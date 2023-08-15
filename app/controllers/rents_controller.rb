class RentsController < ApplicationController
    before_action :authenticate_request!

    def index
        if @current_user.admin?
            rents = Rent.all
            render json: { rents: @rents }
        else
            @rents = @current_user.rent.all
            render json: { rents: @rents }
         end
    end

    def create
        # rent = Rent.new(rent_param)
        #this below makes sure only signed user can rent
        rent = @current_user.rent.new(rent_param)
        if rent.save
            render json: {message: 'rent is successfull!'}, status: :ok
        else
            render json: {error: 'rent error' }, status: :unprocessable_entity
        end
    end

    
    private
    def rent_param
      # if using rent.new(rent_param) to create :user_id should be included below
      params.permit(:movie_id, :price, :movie_name, :release_date, :backdrop_path, :image_url, genre: [])
    end
end
