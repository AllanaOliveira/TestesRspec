require 'factory_bot'
FactoryBot.define do
  factory :answer do
    association :question
    description { "Atatattatatatata" }
  end
end