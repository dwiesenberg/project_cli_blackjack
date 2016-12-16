# Blackjack

# class Participant

module Blackjack
  class Participant

    attr_reader :blackjack, :bust


#   def deal_card 

    def deal_card
      @drawn_card = @deck.draw_card
      @hand << @drawn_card
      @points += @drawn_card[:value]
    end    

    protected

    def blackjack?
      if @hand.length == 2 && @points == 21
        @blackjack = true
        return true
      end
      false
    end

    def bust?
      if @points > 21
        @bust = true
        return true 
      end
      false
    end

  end # class Participant
end # module Blackjack 
   