require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it "returns the correct weapon title" do
    name = FFaker::Name.first_name
    level = FFaker::Random.rand(1..99)

    weapon = create(:weapon, name: name, level: level)
    expect(weapon.title).to eq("#{name} ##{level}")
  end

  it "returns the correct weapon power" do
    level = FFaker::Random.rand(1..99)
    power_base = FFaker::Random.rand(1..99)
    power_step = FFaker::Random.rand(1..99)

    weapon = create(:weapon, power_step: power_step, power_base: power_base, level: level)
    expect(weapon.current_power).to eq(power_base + (power_step * (level - 1)))
  end
end
