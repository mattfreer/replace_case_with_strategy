require_relative 'referee_strategies'

module Soccer
  class Referee
    def make_decision(incident, player)
      RefereeStrategies.strategy_by_incident(incident).call(player)
    end
  end
end
