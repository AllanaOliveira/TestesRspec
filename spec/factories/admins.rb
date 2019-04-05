require 'factory_bot'
FactoryBot.define do
  factory :admin do
    sequence(:email)  {Faker::Internet.unique.email.split('@')[0]+'@id.uff.br'}
    password{ Faker::Internet.unique.password }
    password_confirmation{ password}
    #activated {true}
    #utilizado apenas quando possui-se uma caixinha de check box

  end

end