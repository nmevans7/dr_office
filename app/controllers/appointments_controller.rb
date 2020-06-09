class AppointmentsController < ApplicationController
  before_action :set_doctor
  
  def index
    @appointments = @doctor.appointments
  end

  def edit
    
  end

  def new
    @patients = Patient.all
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @enrollment.destroy
    redirect_to doctor_endrollments_path(@doctor)
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def appointment_params
    params.require(:appointment).permit(:day, :month, :year, :time, :office_name, :patient_id)
  end
  
end
