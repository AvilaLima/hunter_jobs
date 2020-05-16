require 'rails_helper'

feature 'Headhunter register a job' do
  scenario 'from index page' do
    #Logando 
    user = create(:user, role:5)

    login_as user, scope: :user

    visit root_path
    
    expect(page).to have_link('Minhas Vagas', href: jobs_path)
    expect(page).not_to have_link('Meu Perfil', href: new_profile_path)
    
    click_on 'Minhas Vagas'

    expect(page).to have_link('Voltar')
  end

  scenario 'successfully' do
    #Logando 
    user = create(:user, role:5)
    level_job = create(:level_job)
    login_as user, scope: :user

    visit root_path
    click_on 'Minhas Vagas'
    click_on 'Cadastrar Nova Vaga'

    fill_in 'Título', with: 'Título da vaga'
    fill_in 'Descrição', with: 'Essa vaga é uma vaga de emprego LOOOOL'
    fill_in 'Habilidades', with: 'Desejável ter conhecimento em tudo, inclusive terra plana.'
    fill_in 'Salário', with: 'entre 4000 e 5000'
    fill_in 'Data Limite', with: Date.tomorrow 
    fill_in 'Local', with: 'São Paulo'
    select level_job.level, from: 'Nível'
    click_on 'Enviar'

    expect(page).to have_content('Título da vaga')
    expect(page).to have_content('Essa vaga é uma vaga de emprego LOOOOL')
    expect(page).to have_content('Desejável ter conhecimento em tudo, inclusive terra plana.')
    expect(page).to have_content(level_job.level)
    expect(page).to have_content('entre 4000 e 5000')
    expect(page).to have_content(Date.tomorrow)
    expect(page).to have_content('São Paulo')
    expect(page).to have_link('Voltar')

  end

  scenario 'cannot view unless logged in' do
    visit new_job_path

    expect(current_path).to eq(new_user_session_path)
  end
  
  scenario 'cannot view unless logged in' do
    visit root_path

    expect(page).not_to have_link('Minhas Vagas')
  end
end