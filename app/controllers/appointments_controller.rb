class AppointmentsController < ApplicationController
  before_action :set_doctor
  
  def index
    @appointment = @doctor.appointments.find(appointment_params)
  end

  def edit
   @appointment = Appointment.find(params[:id])
   @patients = Patient.all
  end

  def update

  end


  def new
    @patients = Patient.all
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      # redirect_to root_path
      redirect_to doctor_appointment_path(@doctor, @appointment)
    else
      render :new
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    @patient = Patient.find(params[:id])
  end

  def destroy
    @appointment = @doctor.appointments.find(appointment_params)
    @appointment.destroy
    redirect_to doctor_endrollments_path(@doctor)
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def appointment_params
    params.require(:appointment).permit(:day, :month, :year, :time, :office_name, :patient_id, :doctor_id)
  end
  
end

