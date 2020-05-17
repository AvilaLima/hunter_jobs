class HomeController < ApplicationController
  def index
    if current_user.candidate?
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
        redirect_to new_profile_path
      end
    end
  end

end
