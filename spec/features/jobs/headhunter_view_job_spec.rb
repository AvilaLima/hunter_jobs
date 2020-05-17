require 'rails_helper'

feature 'Headhunter view jobs' do
  scenario 'successfully' do
    #Logando como headhunter
    user = create(:user, email:"teste@teste.com.br", role:5)
    a_user = create(:user, email: "outro@email.com.br",role:5)
    login_as user, scope: :user

    level_job = create(:level_job)
    job = create(:job, email: user.email)
    another_job = create(:job, email: a_user.email)

    visit root_path
    click_on 'Minhas Vagas'    

    expect(page).to have_content(job.title)
    expect(page).to have_link(job.title)
    expect(page).not_to have_content(another_job.email)
    click_on job.title

    expect(current_path).to eq(job_path(job))
    expect(current_path).not_to eq(job_path(another_job))
  end

  scenario 'and view details' do     
    #Logando como headhunter
    user = create(:user, email:"teste@teste.com.br", role:5)
    login_as user, scope: :user

    level_job = create(:level_job)
    job = create(:job, email: user.email)
    visit root_path
    click_on 'Minhas Vagas'

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
    user = create(:user, role:5)
    login_as user, scope: :user
    visit root_path
    click_on 'Minhas Vagas'

    expect(page).to have_content('Nenhuma vaga cadastrada')
  end

  scenario 'and return to home page' do
    #Logando headhunter
    user = create(:user, role:5)
    login_as user, scope: :user
    visit root_path
    click_on 'Minhas Vagas'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
  
  scenario 'and return to jobs page' do
    #Logando como headhunter
    user = create(:user, email:"teste@teste.com.br", role:5)
    login_as user, scope: :user

    level_job = create(:level_job)
    job = create(:job, email: user.email)
    visit root_path
    click_on 'Minhas Vagas'

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

    expect(page).not_to have_link('Minhas Vagas')
  end
end
