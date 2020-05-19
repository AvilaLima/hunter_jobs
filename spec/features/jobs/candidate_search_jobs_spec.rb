require 'rails_helper'

feature 'Candidate search job by title' do
  scenario 'by exact name' do
    job = create(:job, title:'Analista de Suporte')
    another_job = create(:job, title:'Analista de Redes')

    user = create(:user,role:0)
    profile = create(:profile,email: user.email)
    login_as user, scope: :user
    
    visit root_path
    click_on 'Vagas'
    fill_in 'Busca', with: job.title
    click_on 'Buscar'

    expect(page).to have_content(job.title)
    expect(page).not_to have_content(another_job.title)
  end

  scenario 'by partial name' do
    job = create(:job, title:'Analista de Suporte')
    another_job = create(:job, title:'Analista de Redes')

    user = create(:user)
    profile = create(:profile,email: user.email)
    login_as user, scope: :user

    visit root_path
    click_on 'Vagas'
    fill_in 'Busca', with: 'Analista de S'
    click_on 'Buscar'

    expect(page).to have_content(job.title)
    expect(page).not_to have_content(another_job.title)
  end
end

feature 'Candidate search job by summary' do
  scenario 'by partial name' do
    job = create(:job, title: 'Analista de Redes' ,summary:'Resumo da vaga')
    another_job = create(:job, title: 'Analista de TI', summary:'sim isso é um summary')

    user = create(:user)
    profile = create(:profile,email: user.email)
    login_as user, scope: :user

    visit root_path
    click_on 'Vagas'
    fill_in 'Busca', with: 'da vaga'
    click_on 'Buscar'

    expect(page).to have_content(job.title)
    expect(page).not_to have_content(another_job.title)
  end
end

feature 'Candidate search blank or not find a job' do
  scenario 'and cannot be blank' do
    user = create(:user)
    profile = create(:profile,email: user.email)

    login_as user, scope: :user
    visit root_path
    click_on 'Vagas'
    fill_in 'Busca', with: ''
    click_on 'Buscar'

    expect(page).to have_content('Nenhum resultado para:')
  end

  scenario 'not find a job' do
    user = create(:user)
    profile = create(:profile,email: user.email)

    login_as user, scope: :user
    visit root_path
    click_on 'Vagas'
    fill_in 'Busca', with: 'Analista de TI'
    click_on 'Buscar'

    expect(page).to have_content('Nenhum resultado para: Analista de TI')
  end
end
  