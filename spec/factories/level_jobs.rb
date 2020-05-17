FactoryBot.define do
  factory :level_job do    
    sequence(:level) {|n| "level#{n}"}
  end
end
