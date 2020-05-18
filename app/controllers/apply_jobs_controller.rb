class ApplyJobsController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
    @profile = Profile.find_by(email: current_user.email)    
    if ApplyJob.exists?(profile: @profile, job: @job)
      flash[:notice] = 'Você já se candidatou a essa vaga, boa sorte.'      
      redirect_to jobs_path
    else
      @apply_job  = ApplyJob.new
    end
  end  

  def create 
    @job = Job.find(params[:job_id])
    @profile = Profile.find_by(email: current_user.email)
    @apply_job = ApplyJob.new(params.require(:apply_job).permit(:cover_letter))
    @apply_job.profile = @profile
    @apply_job.job = @job
    if @apply_job.save   
      flash[:notice] = 'Parabéns, você está concorrendo à vaga, boa sorte.'      
      redirect_to jobs_path
    else  
      render :new
    end
  end
end