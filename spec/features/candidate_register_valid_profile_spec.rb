require 'rails_helper'
  feature 'Candidate register valid profile' do
    scenario 'and name can not be blank' do
      #Logando
      user = create(:user)
      login_as user, scope: :user

      visit root_path
      click_on 'Meu Perfil'

      fill_in 'Nome Completo', with: ''
      click_on 'Enviar'

      expect(page).to have_content('Nome Completo não pode ficar em branco')
    end

    scenario 'and birth_date can not be blank' do
      #Logando
      user = create(:user)  
      login_as user, scope: :user

      visit root_path
      click_on 'Meu Perfil'

      fill_in 'Data de aniversário', with: ''
      click_on 'Enviar'
      
      expect(page).to have_content('Data de aniversário não pode ficar em branco')
    end
  end