class AppointmentsController < ApplicationController
  before_action :set_patient
  
  def index
    @patient.appointments.all
  end

  def edit
    
  end

  def new
    @appoint = @patient.appointments.new
  end

  def create
    @appointment = @patient.appointments.new(appointment_params)
    if @appointment.save
      redirect_to patient_appointments_path(@patient)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @appointment = @patient.appointments.find(params[:id])
    @enrollment.destroy
    redirect_to patient_endrollments_path(@patient)
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def appointment_params
    params.require(:appointment).permit(:doctor_id)
  end
  
end
