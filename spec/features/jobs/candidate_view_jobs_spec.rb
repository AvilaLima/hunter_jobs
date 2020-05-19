require 'rails_helper'

feature 'Candidate view jobs' do
  scenario 'successfully' do
    user = create(:user)
    profile = create(:profile,email: user.email)
    
    #Logando como candidate
    login_as user, scope: :user

    level_job = create(:level_job)
    job = create(:job)
    another_job = create(:job)

    visit root_path
    click_on 'Vagas'    

    #click_on "details-#{uno.id}" ou 
    find("a#details-#{job.id}").click()

    expect(current_path).to eq(job_path(job))
    expect(current_path).not_to eq(job_path(another_job))
  end

  

  scenario 'and view details' do     
    #Logando como candidate
    user = create(:user)
    profile = create(:profile,email: user.email)
    login_as user, scope: :user

    level_job = create(:level_job)
    job = create(:job)
    visit root_path
    click_on 'Vagas'

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

  scenario 'and no jobs are created' do
    #Logando
    user = create(:user)
    profile = create(:profile,email: user.email)
    login_as user, scope: :user
    visit root_path
    click_on 'Vagas'

    expect(page).to have_content('Nenhuma vaga')
  end

  scenario 'and return to home page' do
    #Logando
    user = create(:user)
    profile = create(:profile,email: user.email)
    login_as user, scope: :user
    visit root_path
    click_on 'Vagas'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
  
  scenario 'and return to jobs page' do
    #Logando como candidate
    user = create(:user)
    profile = create(:profile,email: user.email)
    login_as user, scope: :user

    level_job = create(:level_job)
    job = create(:job)
    visit root_path
    click_on 'Vagas'

    expect(page).to have_content(job.title)
    expect(page).to have_link(job.title)
    click_on job.title

    expect(page).to have_link('Voltar')
    click_on 'Voltar'
    expect(current_path).to eq jobs_path
  end

  scenario 'cannot view unless logged in' do
    visit jobs_path

    expect(current_path).to eq(new_user_session_path)
  end
  scenario 'cannot view unless logged in' do
    visit jobs_path

    expect(page).not_to have_link('Vagas disponíveis')
  end
end


feature 'Candidate not view a job closed' do
  scenario 'successfully' do
    user = create(:user, email:"candidate@teste.com.br", role:0)
    profile = create(:profile,email: user.email)
    login_as user, scope: :user

    job = create(:job, email: user.email, status: 5)

    another_job = create(:job, title: 'Outra vaga', email: user.email)

    visit root_path
    click_on 'Vagas'  

    expect(page).to have_content(another_job.title)
    expect(page).not_to have_content(job.title)
  end
end