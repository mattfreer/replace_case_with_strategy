module Soccer
  class RefereeStrategies
    def self.strategy_by_incident(incident)
      instance_variable_get("@#{ incident.type }_foul_strategy")
    end

    @violent_foul_strategy = Proc.new do |player|
      Decision.new(:caution => true, :card => Card::Red.new)
    end

    @deliberate_foul_strategy = Proc.new do |player|
      card = player.yellow_cards.count == 0 ? Card::Yellow.new : Card::Red.new
      Decision.new(:caution => true, :card => card)
    end

    @accidential_foul_strategy = Proc.new do |player|
      Decision.new(:caution => false)
    end
  end
end
