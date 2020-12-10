require 'spec_helper'
require 'hero'

describe Hero do
    context 'when hero has an armor' do
        hero = Hero.new
        if hero.armor
            it 'has a sword' do
                expect(hero.weapon).to eq('sword')
            end
        
            it 'has more than or equals to 1000 HP points' do
                expect(hero.hp).to be >= 1000
            end
        end
    end

    context 'when hero has no armor' do
        hero = Hero.new
        if(not hero.armor)
            it 'is bare handed' do
                expect(hero.weapon).to eq('hands')
            end
        
            it 'has less than 1000 HP points' do
                expect(hero.hp).to be < 1000
            end
        end
    end
end