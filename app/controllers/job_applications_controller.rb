class JobApplicationsController < ApplicationController
  def new
    @job_application = JobApplication.new
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    @job_application.user = current_user

    if @job_application.valid? && @job_application.save
      @job_application.position.position_criteriums.each do |crit|
        @job_application.job_application_requirements.create(position_criterium: crit)
      end

      redirect_to job_application_path(@job_application)
    else
      redirect_to root_path, alert: 'Dogodila se greška. Pokušajte ponovno.'
    end
  end

  def show
    @job_application = JobApplication.find(params[:id])
  end

  def validate_cv
    @job_application = JobApplication.find(params[:id])

    CvValidator.new(@job_application).validate

    redirect_to job_application_path(@job_application)
  end

  def view_cv
    @job_application = JobApplication.find(params[:id])
  end

  def update
    @job_application = JobApplication.find(params[:id])

    if @job_application.update(update_params)
      redirect_to job_application_path(@job_application)
    else
      redirect_to job_application_path(@job_application), alert: "Dogodila se greška. Pokušajte ponovno."
    end
  end

  private

  def job_application_params
    params.require(:job_application).permit(
      :applicant_full_name,
      :applicant_phone_number,
      :applicant_oib,
      :applicant_address,
      :cv_text,
      :position_id
    )
  end

  def update_params
    params.permit(:status)
  end
end