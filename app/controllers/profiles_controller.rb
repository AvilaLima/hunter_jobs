class ProfilesController < ApplicationController
  def index
  end

  def show 
    @profile = Profile.find(params[:id])
  end

  def new
    if Profile.exists?(email: current_user.email)
      @profile = Profile.find_by(email: current_user.email)      
      if @profile.social_name.blank? || @profile.formation.blank? || 
        @profile.summary.blank? || @profile.experience.blank?         
			  flash[:notice] = 'Por favor finalize seu perfil para utilizar o sistema'
        redirect_to edit_profile_path(@profile)
      end
    else
      @profile = Profile.new
      @profile.email = current_user.email
    end
  end

  def create  
    @profile = Profile.new(profile_params)
    @profile.email = current_user.email
    if @profile.save
      flash[:notice] = 'Perfil criado com sucesso'
      redirect_to @profile
    else
      render :new
    end     
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:notice]= 'Perfil atualizado com sucesso'
      redirect_to @profile
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:email,:name, :social_name,:birth_date ,:formation,
    :summary,:experience,:avatar)
  end
end
