FactoryBot.define do
  factory :job do
    title { "Título da Vaga" }
    summary { "Resumo da Vaga" }
    qualification { "Habilidade da Vaga" }
    salary { "até R$ 4000" }
    date_limit { "19/09/2099" }
    location { "São Paulo" }
    email { "teste@teste.com.br"}
    status { 0 }
    level_job
  end
end
