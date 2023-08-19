class BookmarksController < ApplicationController
    before_action :authenticate_request!

    #GET /bookmarks
    def index
        if @current_user.admin?
          bookmarks = Bookmark.all
          render json: { bookmarks: @bookmarks }
        else
          @bookmarks = @current_user.bookmark.all
          render json: { bookmarks: @bookmarks }
        end
    end
  
    #POST /bookmarks
      def create
          # bookmark = Bookmark.new(bookmark_param)
          #this below makes sure only signed user can bookmark
          bookmark = @current_user.bookmark.new(bookmark_param)
          if bookmark.save
              render json: {message: 'bookmark is successfull!'}, status: :ok
          else
              render json: {error: 'bookmark error' }, status: :unprocessable_entity
          end
      end

    # DELETE /bookmarks/:id
    # Body {user_id}
    def destroy
        user_id = params.require(:user_id)
        bookmark = Bookmark.find_by(id: params.require(:id), user_id: user_id)
        if @current_user.admin?
            if bookmark.destroy
                render json: {message: 'user bookmark deleted successfully!'}, status: :ok
            else 
                render json: {error: 'error deleting bookmark'}, status: :unprocessable_entity
            end
        elsif @current_user.id == user_id.to_i
            if bookmark.destroy
                render json: {message: 'user bookmark deleted successfully!'}, status: :ok
            else 
                render json: {error: 'error deleting bookmark'}, status: :unprocessable_entity
            end
        else
            render json: {error: 'unauthorized'}, status: :unauthorized
        end
    end


    private
    def bookmark_param
    # if using bookmark.new(bookmark_param) to create :user_id should be included below
        params.permit(:movie_id, :buy_price, :rent_price, :movie_name, :release_date, :backdrop_path, :image_url,:summary , genre: [])
    end
end
