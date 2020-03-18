class UsersController < ApplicationController
  def index
    @search = false
    if params[:search] == "true"
      @search = true
    end
    if params[:commit] == "Search"
      @search = true
      @users = policy_scope(User)
        .where("first_name LIKE ?", "%#{params[:first_name]}%")
        .where("last_name LIKE ?", "%#{params[:last_name]}%")
        .where("email LIKE ?", "%#{params[:email]}%")
        .joins(:access_level, :role).where("access_levels.title LIKE ? AND roles.title LIKE ?", "%#{params[:access_level][:title]}%", "%#{params[:role][:title]}%")
    else
      @users = policy_scope(User)
    end
    @users = @users.order(:id).paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      sign_in(@user, bypass: true) if @user == current_user
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_picture, :role_id, :access_level_id, :email, :password, :password_confirmation)
  end
end
