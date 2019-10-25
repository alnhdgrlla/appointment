class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update!(doctor_params)
      redirect_to @doctor
    else
      render :edit
    end
  end

  def doctor_params
    params.require(:user).permit(:name, :speciality)
  end

end
