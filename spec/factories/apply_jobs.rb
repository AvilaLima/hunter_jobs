FactoryBot.define do
  factory :apply_job do
    status { 0 }
    cover_letter { "Uma carta de apresentação" }
    feedback_headhunter { "Feedback do headhunter" }
    profile
    job
  end
end
