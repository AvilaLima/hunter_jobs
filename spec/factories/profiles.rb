FactoryBot.define do
  factory :profile do 
    sequence(:name) {|n| "Nome Completo#{n}"}
    social_name { "MyString" }
    birth_date { "12/06/2020" }
    formation { "MyString" }
    summary { "MyString" }
    experience { "MyString" }
    favorite { 1 }
    email { "teste@teste.com.br"}
  end
end
