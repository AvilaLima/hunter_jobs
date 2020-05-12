require 'rails_helper'

feature 'Candidate register profile' do
  scenario 'from index page' do
    #Logando
    user = create(:user)
    login_as user, scope: :user

    visit root_path

    expect(page).to have_link('Meu Perfil', href: new_profile_path)
    click_on 'Meu Perfil'

    expect(page).to have_link('Voltar')
  end

  scenario 'successfully' do
    #Logando
    user = create(:user)
    login_as user, scope: :user

    visit root_path

    click_on 'Meu Perfil'

    fill_in 'Nome Completo', with: 'John Doe Doe'
    fill_in 'Nome Social', with: 'John Doe'
    fill_in 'Data de aniversário', with: '24/07/1990'
    fill_in 'Formação', with: 'Superior'
    fill_in 'Experiência', with: 'Tenho 10 anos de experiência em TI'
    fill_in 'Descrição', with: 'Uma descrição muito boa do meu perfil'
    click_on 'Enviar'
    
    expect(page).to have_content('John Doe Doe')
    expect(page).to have_content('John Doe')
    expect(page).to have_content('24/07/1990')
    expect(page).to have_content('Superior')
    expect(page).to have_content('Tenho 10 anos de experiência em TI')
    expect(page).to have_link('Voltar')
  end


  scenario 'cannot view unless logged in' do
    visit new_profile_path

    expect(current_path).to eq(new_user_session_path)
  end
  scenario 'cannot view unless logged in' do
    visit root_path

    expect(page).not_to have_link('Meu perfil')
  end
end