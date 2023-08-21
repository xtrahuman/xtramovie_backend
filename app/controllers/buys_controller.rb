# frozen_string_literal: true

class BuysController < ApplicationController
  before_action :authenticate_request!

  # GET /buys
  def index
    if @current_user.admin?
      buys = Buy.all
    else
      @buys = @current_user.buy.all
    end
    render json: { buys: @buys }
  end

  # POST /buys
  # Body {buy_param}
  def create
    # buy = Buy.new(buy_param)
    # this below makes sure only signed user can buy
    buy = @current_user.buy.new(buy_param)
    if buy.save
      render json: { message: 'buy is successfull!' }, status: :ok
    else
      render json: { error: 'buy error' }, status: :unprocessable_entity
    end
  end

  private

  def buy_param
    # if using Buy.new(buy_param) to create :user_id should be included below
    params.permit(:movie_id, :price, :movie_name, :release_date, :backdrop_path, :image_url, genre: [])
  end
end
