# Blackjack

# class Dealer

module Blackjack
  class Dealer < Participant

    attr_reader :name, :blackjack, :bust, :bust_with_ace, :ace_with_over_16
    attr_accessor :hand, :points

    def initialize(deck, board, name)
      @deck = deck
      @board = board
      @name = name
      @hand = []
      @points = 0
    end

    private

#  begin from @dealer.continue_round

    def dealer_continues
      puts "\nDealer's turn - reveals his second card ..."
      deal_card
      loop do
        @blackjack, @ace_with_over_16, @bust = false, false, false
        blackjack? || ace_with_over_16? || bust?
        @board.render_layout
        if @blackjack || @bust || next_move == "P"  
          print "\nEnd of #{@name}'s turn; press enter to continue." 
          gets
          return # on to results method in class Game
        end          
        deal_card
      end
    end

    # methods blackjack? bust? next_move in parent class

    def ace_with_over_16?
      if @points > 16
        @hand.each do |card|
          if card[:value] == 11
            card[:value] = 1
            @points -= 10
            @ace_with_over_16 = true
            return true # return immediately so that another ace in hand is not reset as well
          end
          break
        end
      end
      false
    end

    def next_move
      if @points < 17
        puts "\nDealer draws again as his score is less than 17."
        print "Press enter when ready to proceed: "
        gets
      else
        return "P"
      end
    end
    
# end from @dealer.players_continue

    def reset_dealer_parameters 
      # from @game.reset_parameters when starting new round
      @blackjack, @ace_with_over_16, @bust = false, false, false
    end

    public :dealer_continues, :reset_dealer_parameters

  end # class Dealer
end # module Blackjack 
   