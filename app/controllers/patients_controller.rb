class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update!(patient_params)
      redirect_to @patient
    else
      render :edit
    end
  end

  def patient_params
    params.require(:user).permit(:name, :bio)
  end

end
