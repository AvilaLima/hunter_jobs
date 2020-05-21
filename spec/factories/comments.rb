FactoryBot.define do
  factory :comment do
    message { "Comentário do Headhunter" }
    user
    profile
  end
end
