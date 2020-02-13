class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.permit(:user).require(:first_name, :last_name, :email, :password)
  end
end
