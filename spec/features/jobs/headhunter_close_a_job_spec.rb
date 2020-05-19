require 'rails_helper'

feature 'Headhunter closes a job' do
  scenario 'successfully' do
    user = create(:user, email:"headhunter@teste.com.br", role:5)
    login_as user, scope: :user

    job = create(:job, email: user.email)
    another_job = create(:job, title: 'Outra vaga', email: user.email)

    visit root_path
    click_on 'Minhas Vagas'  

    expect(page).to have_content(job.title)
    expect(page).to have_content("Encerrar #{job.title}")
    click_on "Encerrar #{job.title}"

    expect(current_path).to eq(jobs_path)
    expect(page).to have_content("Encerrada")
  end

  scenario 'try close a job closed' do 
  end
end
