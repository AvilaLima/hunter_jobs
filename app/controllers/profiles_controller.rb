class ProfilesController < ApplicationController
  def index
  end

  def show 
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create  
    @profile = Profile.new(profile_params)
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
    if @profile.update(carcategory_params)
      flash[:notice]= 'Perfil atualizada com sucesso'
      redirect_to @profile
    else
      render :edit
    end
  end
  private

  def profile_params
    params.require(:profile).permit(:name, :social_name,:birth_date ,:formation,
    :summary,:experience,:favorite,:avatar)
  end
end
