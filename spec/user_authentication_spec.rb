require 'rails_helper'

feature 'User authentication' do
  scenario 'successfully' do
    user = User.create!(email: 'teste@gmail.com', password: '12345678')

    visit root_path

    fill_in 'Email', with: 'teste@gmail.com'
    fill_in 'Senha', with: '12345678'
    within 'form' do
      click_on 'Entrar'  
    end
    
    expect(page).to have_content('Login efetuado com sucesso!')
    expect(page).to have_link('Sair')

    expect(page).not_to have_link('Entrar')
    expect(current_path).to eq(root_path)

  end

  scenario 'and must fill in all fields' do
    visit root_path
    fill_in 'Email', with: 'teste@gmail.com'
    fill_in 'Senha', with: '12345678'
    within 'form' do
      click_on 'Entrar'  
    end
    
    expect(page).to have_content('Email ou senha inválida')
    expect(page).not_to have_link('Sair')
    expect(current_path).to eq(new_user_session_path)
  end

  context 'log out' do
    scenario 'successfully' do
      user = User.create!(email: 'teste@gmail.com', password: '12345678')

      visit root_path

      fill_in 'Email', with: user.email
      fill_in 'Senha', with: user.password
      within 'form' do
        click_on 'Entrar'  
      end
      
      click_on 'Sair'
      expect(page).to have_content('Para continuar, efetue login ou registre-se.')
      expect(page).not_to have_link('Sair')

      expect(current_path).to eq(new_user_session_path)
    end
  end

  context 'sign up' do
    scenario 'successfully' do
      visit root_path
      click_on 'Cadastrar-me'

      fill_in 'Email', with: 'teste@gmail.com'
      fill_in 'Senha', with: '12345678'
      fill_in 'Confirmação de senha', with: '12345678'
      click_on 'Cadastrar-me'

      expect(page).to have_content('Login efetuado com sucesso.')
      expect(page).to have_link('Sair')

      expect(page).not_to have_link('Entrar')
    end 

  end
end