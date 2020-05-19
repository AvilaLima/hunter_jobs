require 'rails_helper'

feature 'Headhunter see candidates in a job'do
  scenario 'successfully' do    
    #Logando como headhunter
    user = create(:user, email:"headhunter@teste.com.br", role:5)
    candidate = create(:user)  
    profile = create(:profile,email: candidate.email)
  
    login_as user, scope: :user

    job = create(:job, email: user.email)

    apply_job = create(:apply_job, profile: profile, job: job)

    visit root_path
    click_on 'Minhas Vagas'
    find("a#details-#{job.id}").click()

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.summary)
    expect(page).to have_content(job.qualification)
    expect(page).to have_content(job.salary)
    expect(page).to have_content(job.location)
    expect(page).to have_content(job.date_limit)
    expect(page).to have_content(profile.name)
    
    click_on profile.name

    expect(page).to have_content(profile.name)
    expect(page).to have_content(profile.social_name)
    expect(page).to have_content(I18n.l(profile.birth_date))
    expect(page).to have_content(profile.formation)
    expect(page).to have_content(profile.summary)
    expect(page).to have_content(profile.experience)
  end  
end
