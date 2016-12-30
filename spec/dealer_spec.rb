# RSPEC test of blackjack suite

# class Dealer

require 'participant.rb'
require 'dealer.rb'
  include Blackjack

describe Dealer do
  let (:dlr){Dealer.new("deck_stub", "board_stub", "Dealer")}
  it 'should give you a Dealer' do
    expect(dlr).to be_a(Dealer)
  end

  describe '#name' do
    it 'should return the object in instance variable @name' do
      expect(dlr.name).to eq("Dealer")
    end
  end

  describe '#bust_with_ace' do
#    let(:bust_with_ace){false}
    it 'should return the object in instance variable @bust_with_ace as false because it starts out that way' do
#      allow(dlr).to receive(:bust_with_ace).and_return(false)
      expect(dlr.bust_with_ace).to eq(nil)
    end
  end
 
  describe '#hand' do
#    let(:@hand){[["Spades", "A", 11], ["Hearts", 5, 5]]}
    it 'should return the object in instance variable @hand' do     
      allow(dlr).to receive(:hand).and_return([["Spades", "A", 11], ["Hearts", 5, 5]])
      expect(dlr.hand).to eq([["Spades", "A", 11], ["Hearts", 5, 5]])
    end

    it 'should return the instance variable set equal to the input argument hand' do
      expect(dlr.hand=([["Spades", "A", 11], ["Hearts", 5, 5]])).to eq([["Spades", "A", 11], ["Hearts", 5, 5]])
    end
  end

  describe '#points' do
    it 'should return the object in instance variable @points' do
      expect(dlr.points).to eq(0)
    end

    it 'should return the instance variable set equal to the input argument points' do
      expect(dlr.points=(17)).to eq(17)
    end
  end

  describe '#blackjack' do
    it 'should return the object in instance variable @blackjack' do
      expect(dlr.blackjack).to eq(nil)
    end

    it 'should return the instance variable set equal to the input argument blackjack' do
      expect(dlr.blackjack=(true)).to eq(true)
    end
  end

  describe '#ace_with_over_16' do
    it 'should return the object in instance variable @ace_with_over_16' do
      expect(dlr.ace_with_over_16).to eq(nil)
    end

    it 'should return the instance variable set equal to the input argument ace_with_over_16' do
      expect(dlr.ace_with_over_16=(true)).to eq(true)
    end
  end

  describe '#bust' do
    it 'should return the object in instance variable @bust' do
      expect(dlr.bust).to eq(nil)
    end

    it 'should return the instance variable set equal to the input argument bust' do
      expect(dlr.bust=(true)).to eq(true)
    end
  end

  describe '#initialize' do
    it 'should set instance variable to argument deck' do
      expect(dlr.deck).to eq("deck_stub") # note: argument is stub for class instance
    end

    it 'should set instance variable to argument board' do
      expect(dlr.board).to eq("board_stub")
    end

    it 'should set instance variable to argument name' do
      expect(dlr.name).to eq("Dealer")
    end

    it 'should initialize instance variable hand' do
      expect(dlr.hand).to eq([])
    end    

    it 'should initialize instance variable points' do
      expect(dlr.points).to eq(0)
    end 

  end

end






