class Weapon < ApplicationRecord
    validates :level, numericality: { greater_then: 0, less_than_or_equal_to: 99 }
    
    def current_power
        self.power_base + (self.power_step * (self.level - 1))
    end

    def title
        "#{self.name} ##{self.level}"
    end
end
