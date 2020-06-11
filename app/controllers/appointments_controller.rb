class AppointmentsController < ApplicationController
  before_action :set_doctor
  
  def index
    @appointments = @doctor.appointments.all
  end

  def edit
   @appointment = Appointment.find(params[:id])
   @patients = Patient.all
  end

  def update
    @appointment = Appointment.find(params[:id]) 
    if @appointment.update(appointment_params)
      redirect_to doctor_appointment_path(@doctor, @appointment)
    else
      render :new
    end
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
    # @appointments = Appointment.all
    # @patients = Patient.all
    @appointment = Appointment.find(params[:id])
    # @patient = @appointment.patient
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    # redirect_to root_path
    redirect_to doctor_appointments_path(@appointment.doctor_id)
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def appointment_params
    params.require(:appointment).permit(:day, :month, :year, :time, :office_name, :patient_id, :doctor_id)
  end
  
end

