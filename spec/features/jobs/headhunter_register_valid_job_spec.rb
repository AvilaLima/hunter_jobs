require 'rails_helper'
  feature 'Headhunter register valid job' do
    scenario 'and title can not be blank' do      
      #Logando
      user = create(:user, role:5)  
      login_as user, scope: :user

      visit new_job_path
      fill_in 'Título', with: ''
      click_on 'Enviar'

      expect(page).to have_content('Título não pode ficar em branco')
    end

    scenario 'and date_limit cannot be less today' do
      #Logando
      user = create(:user, role:5)
      login_as user, scope: :user

      visit new_job_path
      fill_in 'Data Limite', with: Date.yesterday
      click_on 'Enviar'

      expect(page).to have_content('Não é uma data válida')
    end

    scenario 'and date_limit cannot be today' do
      #Logando
      user = create(:user, role:5)
      login_as user, scope: :user

      visit new_job_path
      fill_in 'Data Limite', with: Date.today
      click_on 'Enviar'

      expect(page).to have_content('Não é uma data válida')
    end

    scenario 'and location cannot be blank' do
      #Logando
      user = create(:user, role:5)
      login_as user, scope: :user

      visit new_job_path
      fill_in 'Local', with: ''
      click_on 'Enviar'

      expect(page).to have_content('Local não pode ficar em branco')      
    end

    scenario 'and salary cannot be blank' do
      #Logando
      user = create(:user, role:5)
      login_as user, scope: :user

      visit new_job_path
      fill_in 'Salário', with: ''
      click_on 'Enviar'

      expect(page).to have_content('Salário não pode ficar em branco')      
    end

    scenario 'and qualification cannot be blank' do
      #Logando
      user = create(:user, role:5)
      login_as user, scope: :user

      visit new_job_path
      fill_in 'Habilidades', with: ''
      click_on 'Enviar'

      expect(page).to have_content('Habilidades não pode ficar em branco')      
    end

  end