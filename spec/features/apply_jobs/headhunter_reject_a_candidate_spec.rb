require 'rails_helper'

feature 'Headhunter reject candidate a job'do
  xscenario 'successfully' do
    #Logando como headhunter
    user = create(:user, email:"headhunter@teste.com.br", role:5)
    candidate = create(:user)  
    profile = create(:profile,email: candidate.email)
  
    login_as user, scope: :user

    job = create(:job, email: user.email)

    apply_job = create(:apply_job, profile: profile, job: job)


    visit root_path
    click_on 'Minhas Vagas'
    find("a#details-#{job.id}").click()

    expect(page).to have_link("Rejeitar Candidato")
    click_on ("Rejeitar Candidato")

    fill_in 'Feedback', with: 'Feedback do hunter[test]'
    click_on 'Enviar'

    expect(page).to have_content('A candidatura foi rejeita com sucesso')
    expect(current_path).to eq(job_path(job))
  end
end