class Enemy < ApplicationRecord
    enum kind: [ :goblin, :orc, :demon, :dragon ]
    validates :level, numericality: { greater_then: 0, less_than_or_equal_to: 99 }
    validates_presence_of :name, :power_base, :power_step, :level, :kind

    def current_power
        self.power_base + (self.power_step * (self.level - 1))
    end
end
