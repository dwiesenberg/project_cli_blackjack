# RSPEC test of blackjack suite

# class Player


# require 'participant.rb'
require 'participant.rb'
require 'player.rb'
include Blackjack

describe Player do
  let (:plyr){Player.new("deck_stub", "board_stub", "Dealer", 500)}
  it 'should give you a Player' do
    expect(plyr).to be_a(Player)
  end

  describe '#name' do
    it 'should return the object in instance variable @name' do
      expect(plyr.name).to eq("Dealer")
    end
  end

  describe '#chips' do
    it 'should return the object in instance variable @chips' do
      expect(plyr.chips).to eq(500)
    end
  end

  describe '#bet' do
#    let(:@bet){60}
    it 'should return the object in instance variable @bet' do
      expect(plyr.bet).to eq(nil)
    end
  end

  describe '#blackjack' do
#    let(:@blackjack){false}
    it 'should return the object in instance variable @blackjack' do
      expect(plyr.blackjack).to eq(nil)
    end
  end

  describe '#bust' do
    let(:@bust){false}
    it 'should return the object in instance variable @bust' do
      expect(plyr.bust).to eq(nil)
    end
  end

  describe '#bust_with_ace' do
    let(:@bust_with_ace){false}
    it 'should return the object in instance variable @bust_with_ace' do
      expect(plyr.bust_with_ace).to eq(nil)
    end
  end

  describe '#hand' do
#    let(:@hand){[["Spades", "A", 11], ["Hearts", 5, 5]]}
    it 'should return the object in instance variable @hand' do
      expect(plyr.hand).to eq([])
    end

    it 'should return the instance variable set equal to the input argument hand' do
      expect(plyr.hand=([["Spades", "A", 11], ["Hearts", 5, 5]])).to eq([["Spades", "A", 11], ["Hearts", 5, 5]])
    end
  end

  describe '#points' do
#    let(:@points){16}
    it 'should return the object in instance variable @points' do
      expect(plyr.points).to eq(nil)
    end

    it 'should return the instance variable set equal to the input argument points' do
      expect(plyr.points=(16)).to eq(16)
    end
  end

  describe '#result' do
#    let(:@result){:lose}
    it 'should return the object in instance symbol :result' do
      expect(plyr.result).to eq(nil)
    end

    it 'should return the instance variable set equal to the input argument result' do
      expect(plyr.result=(:lose)).to eq(:lose)
    end
  end


  describe '#initialize' do
    it 'should set instance variable to argument deck' do
      expect(plyr.deck).to eq("deck_stub") # note: argument is stub for class instance
    end

    it 'should set instance variable to argument board' do
      expect(plyr.board).to eq("board_stub")
    end

    it 'should set instance variable to argument name' do
      expect(plyr.name).to eq("Dealer")
    end

    it 'should set instance variable to argument chips' do
      expect(plyr.chips).to eq(500)
    end

    it 'should initialize instance variable hand' do
      expect(plyr.hand).to eq([])
    end    

    it 'should initialize instance variable points' do
      expect(plyr.points).to eq(0)
    end 

  end

end

