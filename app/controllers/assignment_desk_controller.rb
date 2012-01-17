class AssignmentDeskController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @patient = Patient.find(params[:id])
    @areas   = TreatmentArea.all(:order => "name")
    @current_capacity = TreatmentArea.current_capacity
  end

  def update
    patient = Patient.find(params[:id])
    patient_params = params[:patient_params]

    if patient.assign(patient_params[:assigned_to], patient_params[:radiology])
      flash[:notice] = 'Patient was successfully assigned.'
    end

    redirect_to patients_path
  end

end
