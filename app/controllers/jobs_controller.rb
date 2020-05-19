class JobsController < ApplicationController

  def index
    if current_user.candidate?
      @profile = Profile.find_by(email: current_user.email)  
      if @profile.social_name.blank? || @profile.formation.blank? || 
        @profile.summary.blank? || @profile.experience.blank? 
			  flash[:notice] = 'Por favor finalize seu perfil para utilizar o sistema'
        redirect_to edit_profile_path(@profile)
      else
        @jobs = Job.where("DATE(date_limit) >= ?", Date.today).where(status:0)
        if @jobs.count == 0
          flash[:notice] = 'Nenhuma vaga cadastrada'
          render :index
        end
      end
    else     
      @jobs = Job.where(email: current_user.email)
      if @jobs.count == 0
        flash[:notice] = 'Nenhuma vaga cadastrada'
        render :index
      end
    end
  end

  def close
    @job = Job.find(params[:id])
    @job.closed!
    @job.save
    redirect_to jobs_path
  end

  def search    
    @busca = params[:q]
    @jobs = Job.search(@busca)
    if @jobs.blank? || @busca.blank?
      @jobs = Job.all
      flash[:notice]  = "Nenhum resultado para: #{@busca}"
    end
    render :index
  end

  def new
    @job = Job.new
    @level_jobs = LevelJob.all
  end

  def create
    @job = Job.new(job_model_params)
    @job.email = current_user.email
    if @job.save
			redirect_to @job
		else
      @level_jobs = LevelJob.all
			render :new
		end
  end

  def show
    @job = Job.find(params[:id])
    if current_user.headhunter?
      @applyjobs = ApplyJob.where(job_id:params[:id])
      @profiles = @job.profiles      
    end  
  end

  def myjobs
    @profile = Profile.find_by(email: current_user.email)
    @jobs = @profile.jobs
  end

  private

	def job_model_params
    params.require(:job).permit(:title,:summary,:year,:qualification,
      :salary,:date_limit,:location,:level_job_id)
	end
end
