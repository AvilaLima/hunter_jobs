require 'rails_helper'

feature 'Headhunter favorite a candidate' do
  scenario 'successfully' do  
    user = create(:user, email:"teste@teste.com.br", role:5)
    login_as user, scope: :user

    candidate1 = create(:user, email: 'Candidato1@teste.com.br')
    profile1 = create(:profile,email: candidate1.email,favorite:0)
    job = create(:job, email: user.email)

    apply_job = create(:apply_job, profile: profile1, job: job)    

    visit root_path
    click_on 'Minhas Vagas'
    find("a#details-#{job.id}").click()

    find("a#makefav-#{profile1.id}").click()
    expect(current_path).to eq(jobs_path)

    find("a#details-#{job.id}").click()
    expect(page).to have_content("Favorito")
    expect(page).to have_link("Desfavoritar")
  end

  scenario 'twice times' do 
    user = create(:user, email:"teste@teste.com.br", role:5)
    login_as user, scope: :user

    candidate1 = create(:user, email: 'Candidato1@teste.com.br')
    profile1 = create(:profile,email: candidate1.email,favorite:1)
    job = create(:job, email: user.email)

    apply_job = create(:apply_job, profile: profile1, job: job)   

    visit root_path
    click_on 'Minhas Vagas'    
    find("a#details-#{job.id}").click()
    
    expect(page).not_to have_link("a#makefav-#{profile1.id}")
    expect(page).to have_link("Desfavoritar")

  end
  scenario 'undo fav in a candidate' do
    user = create(:user, email:"teste@teste.com.br", role:5)
    login_as user, scope: :user

    candidate1 = create(:user, email: 'Candidato1@teste.com.br')
    candidate2 = create(:user, email: 'Candidato2@teste.com.br')  
    profile1 = create(:profile,email: candidate1.email,favorite:1)
    job = create(:job, email: user.email)
    apply_job = create(:apply_job, profile: profile1, job: job)   

    visit root_path
    click_on 'Minhas Vagas'    
    find("a#details-#{job.id}").click()

    find("a#unmakefav-#{profile1.id}").click()
    expect(current_path).to eq(jobs_path)

    find("a#details-#{job.id}").click()
    expect(page).to have_link("Favoritar")

  end
end