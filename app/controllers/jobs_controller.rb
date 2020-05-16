class JobsController < ApplicationController
  def index
    @jobs = Job.where(id:params[:id])
    if @jobs.count == 0
      flash[:notice] = 'Nenhuma vaga cadastrada'
      render :index
    end
  end

  def new
    @job = Job.new
    @level_jobs = LevelJob.all
  end

  def create
    @job = Job.new(job_model_params)
    if @job.save
			redirect_to @job
		else
      @level_jobs = LevelJob.all
			render :new
		end
  end

  def show
    @job = Job.find(params[:id])
  end

  private

	def job_model_params
    params.require(:job).permit(:title,:summary,:year,:qualification,
      :salary,:date_limit,:location,:level_job_id)
	end
end
