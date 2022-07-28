# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Artist.name }
    description { Faker::Lorem.paragraph }
    category { create :category }
    price { Faker::Number.number(digits: 3) }
    publishing_house { Faker::University.name }
    publishing_date { Faker::Date.between(from: '2014-09-23', to: '2021-09-25') }
    cover { Faker::File.extension }
    language { Faker::ProgrammingLanguage.name }
  end
end
