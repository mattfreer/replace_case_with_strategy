require 'spec_helper'
require 'soccer/referee'
require 'soccer/foul'
require 'soccer/card'
require 'soccer/player'
require 'soccer/decision'

describe Soccer::Referee do
  let(:elbow) { Soccer::Foul::ElbowToHead.new }
  let(:handball) { Soccer::Foul::Handball.new }
  let(:foul_throw) { Soccer::Foul::FoulThrow.new }
  let(:player) { Soccer::Player.new }

  context "Handball" do
    let(:decision) { subject.make_decision(handball, player)}

    it "#caution" do
      decision.caution.should be_true
      decision.card.should be_a_kind_of Soccer::Card::Yellow
    end

    context "Player already has a Yellow card" do
      let(:decision) { subject.make_decision(handball, player)}

      let(:player) do
        p = Soccer::Player.new
        p.add_card(Soccer::Card::Yellow.new)
        p
      end

      it "#caution" do
        decision.caution.should be_true
        decision.card.should be_a_kind_of Soccer::Card::Red
      end
    end
  end

  context "FoulThrow" do
    let(:decision) { subject.make_decision(foul_throw, player)}

    it "#caution" do
      decision.caution.should be_false
      decision.card.should be_nil
    end
  end

  context "ElbowToHead" do
    let(:decision) { subject.make_decision(elbow, player)}

    it "#caution" do
      decision.caution.should be_true
      decision.card.should be_a_kind_of Soccer::Card::Red
    end
  end
end
