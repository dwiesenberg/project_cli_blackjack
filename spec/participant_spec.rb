# RSPEC test of blackjack suite

# class Participant

require 'participant.rb'
include Blackjack

describe Participant do
  let (:prt){Participant.new}
  it 'should give you a Participant' do   
    expect(prt).to be_a(Participant)
  end

  describe '#blackjack' do
    it 'should return the object in instance variable' do
      allow(prt).to receive(:blackjack).and_return(true)
      expect(prt.blackjack).to eq(true)
    end

    it 'should return the object in instance variable' do
      instance_variable_get(:bust){false}
      expect(bust).to eq(false)
    end   


#  describe '#deal_card' do
#    it ''




  end
end



# object.instance_variable_get(:@person)


