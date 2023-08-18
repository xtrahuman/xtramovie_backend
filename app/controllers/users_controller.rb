# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_request!, only: [:create]
  before_action :set_user, only: %i[show destroy]

  # @current_user is only logged in user, @user and @users is any registered user

  # GET /users

  def index
    if @current_user.admin?
        @users = User.all
        render json: @users, status: :ok
    else
        render json: 'only admin can view this', status: :ok
    end
  end

  # GET /users/{userid}
  def show
    if @current_user.admin?
        render json: @user, status: :ok
    elsif @current_user.user?
        if @current_user.id != @user.id.to_i
            render json: 'user unauthorized', status: :unauthorized
        else
            render json: @current_user, status: :ok
        end
    else
        render json: 'unknown user', status: :unprocessable_entity
    end
  end

  # post /users
  def create
    @current_user = User.new(user_params)
    if @current_user.save
      render json: @current_user, status: :created
    else
      render json: { errors: @current_user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{userid}
  def update
    if @current_user.admin?
        unless @user.update(user_params)
            render json: { errors: @user.errors.full_messages },
                   status: :unprocessable_entity
        end
    else 
        unless @current_user.update(user_params)
        render json: { errors: @current_user.errors.full_messages },
                status: :unprocessable_entity
        end
    end
  end

  # DELETE /users/{userid}

  def destroy
    if @current_user.admin?
        if @user.destroy
            render json: { message: 'user deleted' }, status: :ok
        else
            render json: { error: 'Error deleting user' }, status: :unprocessable_entity
        end
    else 
        if @current_user.destroy
            render json: { message: 'user deleted' }, status: :ok
        else
            render json: { error: 'Error deleting user' }, status: :unprocessable_entity
        end
    end
  end

  private

  def user_params
    params.permit(:username, :firstname, :lastname, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
