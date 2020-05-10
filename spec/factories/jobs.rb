=begin
FactoryBot.define do
  factory :job do
    title { 'Vaga de emprego'}
    level { 'Trainee'}
    qualification { ''}
    salary {'4000-5000'}
    end_date { Date.today}
    location { 'São Paulo'}
  end
  #no teste colocar factory = create(:job)
  #no teste colocar factory = create(:job, title: 'Meu título')
  factory :profile do
    sequence(:name) {|n| "Perfil#{n}"}
  end
end
=end