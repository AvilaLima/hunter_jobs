require 'rails_helper'

feature 'Candidate apply a job'do

  scenario 'successufly' do     
    user = create(:user)
    profile = create(:profile,email: user.email)
    
    #Logando como candidate
    login_as user, scope: :user

    job = create(:job)

    visit root_path
    click_on 'Vagas'

    find("a#details-#{job.id}").click()

    expect(current_path).to eq(job_path(job))

    click_on 'Candidatar-se'

    fill_in 'Carta de Apresentação', with: 'Tenho muito exp. estou lvl. 100 já'

    click_on 'Enviar'

    expect(current_path).to eq(jobs_path)
    expect(page).to have_content('Parabéns, você está concorrendo à vaga, boa sorte.')
   end

   scenario 'does not make a cove letter' do      
    user = create(:user)
    profile = create(:profile,email: user.email)
    
    #Logando como candidate
    login_as user, scope: :user

    job = create(:job)

    visit root_path
    click_on 'Vagas'

    find("a#details-#{job.id}").click()

    expect(current_path).to eq(job_path(job))

    click_on 'Candidatar-se'

    fill_in 'Carta de Apresentação', with: ''

    click_on 'Enviar'
    
    expect(page).to have_content('Carta de Apresentação não pode ficar em branco')
   end

   scenario 'make apply a same job for a second time' do
    user = create(:user)
    profile = create(:profile,email: user.email)
    
    #Logando como candidate
    login_as user, scope: :user

    job = create(:job)
    application = create(:apply_job, profile: profile, job: job)
    visit root_path
    click_on 'Vagas'

    find("a#details-#{job.id}").click()

    expect(page).to have_link('Candidatar-se', href: new_job_apply_job_path(job))    
    
    click_on 'Candidatar-se'

    expect(page).to have_content('Você já se candidatou a essa vaga, boa sorte.')
  end
end