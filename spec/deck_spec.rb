# RSPEC test of blackjack suite

# class Deck

require 'deck.rb'
include Blackjack

describe Deck do
  let (:dck){Deck.new}
  it 'should give you a Deck' do
    expect(dck).to be_a(Deck)
  end

  describe '#drawn_card' do
    let(:@drawn_card){[["Spades", "A", 11], ["Hearts", 5, 5]]}
    it 'should return the object in instance variable' do
#      expect(dck.drawn_card).to eq([["Spades", "A", 11], ["Hearts", 5, 5]])
      expect(dck.drawn_card).to eq(nil)
    end
  end

  describe '#cards' do
    let(:@cards){[["Spades", "A", 11], ["Hearts", 5, 5]]}
    it 'should return the object in instance variable' do
#      expect(dck.cards).to eq([["Spades", "A", 11], ["Hearts", 5, 5]])
      expect(dck.cards).to eq(nil)
    end
  end 

  describe '#create_card_deck' do
    it 'creates an empty card array' do
      allow(dck).to receive(:manufacture_card_deck)
      dck.create_card_deck
      expect(dck.cards).to eq([])
    end

    it 'should call method manufacture_card_deck (in order to return a card deck)' do
      allow(dck).to receive(:manufacture_card_deck).and_return([["Spades", "A", 11], ["Hearts", 5, 5]])
      expect(dck.create_card_deck).to eq([["Spades", "A", 11], ["Hearts", 5, 5]]) 
    end
  end

end
