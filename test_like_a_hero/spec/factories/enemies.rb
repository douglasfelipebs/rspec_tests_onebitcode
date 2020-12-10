FactoryBot.define do
  factory :enemy do
    name { FFaker::Lorem.word }
    level { FFaker::Random.rand(1..99) }
    power_base { FFaker::Random.rand(1000..3000) }
    power_step { FFaker::Random.rand(100..300) }
    kind { %w[goblin orc demon dragon].sample }
  end
end
