class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id]) if current_user
  end

  def update
  @user = User.find(params[:id])
    if @user.update!(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :bio)
  end

end
