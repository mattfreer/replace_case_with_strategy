module Soccer
  class Referee
    def make_decision(incident, player)
      case(incident.type)
      when Foul::DELIBERATE then
        card = player.yellow_cards.count == 0 ? Card::Yellow.new : Card::Red.new
        Decision.new(:caution => true, :card => card)

      when Foul::VIOLENT then
        Decision.new(:caution => true, :card => Card::Red.new)

      when Foul::ACCIDENTIAL then
        Decision.new(:caution => false)
      end
    end
  end
end
