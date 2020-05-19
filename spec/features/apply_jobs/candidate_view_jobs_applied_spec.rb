require 'rails_helper'
  
feature 'candidate view jobs who applieds'  do
  scenario 'successfully' do
    user = create(:user)
    profile = create(:profile,email: user.email)
    
    #Logando como candidate
    login_as user, scope: :user

    job = create(:job)
    another_job = create(:job,title: 'Outra vaga')

    application = create(:apply_job, profile: profile, job: job)

    visit root_path
    click_on 'Minhas Vagas'

    expect(page).to have_link(job.title)
    expect(page).not_to have_link(another_job.title)

  end

  scenario 'view details about that job' do
    
    user = create(:user)
    profile = create(:profile,email: user.email)
    
    #Logando como candidate
    login_as user, scope: :user

    job = create(:job)
    another_job = create(:job,title: 'Outra vaga')

    application = create(:apply_job, profile: profile, job: job)

    visit root_path
    click_on 'Minhas Vagas'

    expect(page).to have_link(job.title)
    expect(page).not_to have_link(another_job.title)

    click_on job.title
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.summary)
    expect(page).to have_content(job.qualification)
    expect(page).to have_content(job.salary)
    expect(page).to have_content(job.date_limit)
    expect(page).to have_content(job.qualification)
    expect(page).to have_content(job.location)
    expect(page).to have_content(job.level_job.level)
    expect(page).to have_link('Voltar')
  end

  scenario 'cannot view unless logged in' do
    visit myjobs_jobs_path

    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'cannot view unless logged in' do
    visit myjobs_jobs_path

    expect(page).not_to have_link('Vagas disponíveis')
  end
end