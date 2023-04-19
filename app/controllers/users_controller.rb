# frozen_string_literal: true

class UsersController < ApplicationController
  # GET /users or /users.json
  def index
    @users = User.all.order(created_at: :desc)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'User successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :send_invite)
  end
end
