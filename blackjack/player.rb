# Blackjack

# class Player

module Blackjack
  class Player < Participant

    attr_reader :points, :name, :hand, :blackjack, :bust, :bust_with_ace, :ace_with_over_16

    def initialize(deck, board, name)
      puts "class Player initialized ... "
      puts "in class Player ... "

      @deck = deck
      @board = board
      @name = name
      @hand = []
      @points = 0

    end


#  begin from @game.continue_round

    def players_continue
      loop do 
        @blackjack, @bust, @bust_with_ace = false, false, false
        blackjack? || bust_with_ace? || bust?
        puts "\n#{@name}'s turn ..."
        @board.render_layout 
        if @blackjack || @bust || next_move == "P" 
          print "\nEnd of #{@name}'s turn; press enter to continue." 
          gets
          return
        end
        deal_card
      end
    end


    def bust_with_ace?
      if @points > 21
        @hand.each do |card|
          if card[:value] == 11
            card[:value] = 1
            @points -= 10
            @bust_with_ace = true
            return true # return immediately so that another ace in hand is not reset as well
          end
        end
      end
      false
    end

    def next_move
      print "#{@name}: do you want to hit or pass (H or P)? "
      until %w(H P).include? (answer = gets.chomp)
        print "Incorrect answer -- try again: "
      end
      answer
    end


# end from @game.players_continue










  end # class Player
end # module Blackjack 
   






