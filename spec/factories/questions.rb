FactoryBot.define do
  factory :question do
    association :subject
    description { "Descrição" }
  end


end