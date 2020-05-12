FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "usuario#{n}@teste.com.br"}
    password { '12345678'}
  end
end
