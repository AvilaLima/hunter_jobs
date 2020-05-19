class ApplyJobsController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
    @profile = Profile.find_by(email: current_user.email)    
    if ApplyJob.exists?(profile: @profile, job: @job)
      @apply_job = ApplyJob.find_by(profile: @profile)
      if @apply_job.pending?
        flash[:notice] = 'Você já se candidatou a essa vaga, boa sorte.'      
        redirect_to jobs_path
      end
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

  def send_reject 
    @apply_job = ApplyJob.find(job_id:params[:job_id])
    if @apply_job.update(params.require(:apply_job).permit(:feedback_hunter))
      flash[:notice]= 'Candidato foi removido com sucesso'
      redirect_to jobs_path
    else
      render :send_reject
    end
  end   
  
  def send_reject
    @apply_job = ApplyJob.find(params[:job_id])
    byebug
  end

end