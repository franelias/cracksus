FactoryBot.define do
  factory :game do
    name { Faker::Game.title }

    trait :cracked do
      status { 'cracked' }
      release_date { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
      anti_tamper { Faker::FunnyName.name }
      image_url { 'https://store.steampowered.com/app/588650/Dead_Cells/' }
      store_url { 'https://store.steampowered.com/app/588650/Dead_Cells/' }
      cracked_by { Faker::FunnyName.name }
      crack_date { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
    end

    trait :uncracked do
      status { 'uncracked' }
      release_date { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
      anti_tamper { Faker::FunnyName.name }
      image_url { 'https://store.steampowered.com/app/588650/Dead_Cells/' }
      store_url { 'https://store.steampowered.com/app/588650/Dead_Cells/' }
    end

    trait :unreleased do
      status { 'unreleased' }
    end
  end
end
