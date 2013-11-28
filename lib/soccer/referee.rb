module Soccer
  class Referee
    def make_decision(incident, player)
      case(incident.type)
      when Foul::DELIBERATE then
        deliberate_foul(player)

      when Foul::VIOLENT then
        violent_foul(player)

      when Foul::ACCIDENTIAL then
        accidential_foul
      end
    end

    private

    def deliberate_foul(player)
      card = player.yellow_cards.count == 0 ? Card::Yellow.new : Card::Red.new
      Decision.new(:caution => true, :card => card)
    end

    def violent_foul(player)
      Decision.new(:caution => true, :card => Card::Red.new)
    end

    def accidential_foul
      Decision.new(:caution => false)
    end
  end
end
