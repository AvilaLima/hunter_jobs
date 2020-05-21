require 'rails_helper'

feature 'Headhunter register comment about profile' do
  scenario 'successfully' do
    #Logando como headhunter
    user = create(:user, email:"headhunter@teste.com.br", role:5)
    candidate = create(:user)  
    profile = create(:profile,user:user,email: candidate.email)
  
    login_as user, scope: :user

    job = create(:job, email: user.email)

    apply_job = create(:apply_job, profile: profile, job: job)

    visit root_path
    click_on 'Minhas Vagas'
    find("a#details-#{job.id}").click()
    
    click_on profile.name

    fill_in 'Comentário', with: 'Comentário do headhunter'
    click_on 'Enviar'

    expect(current_path).to eq(profile_path(profile))
    expect(page).to have_content('Comentário adicionado com sucesso') 
    expect(page).to have_content('Comentário do headhunter') 
    expect(page).to have_content(I18n.l(Time.zone.today, format: :short))

  end
end