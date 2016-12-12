# Blackjack

# class Player

module Blackjack
  class Player < Participant

    attr_reader :points, :name, :chips, :hand, :bet, :blackjack, :bust, :bust_with_ace, :ace_with_over_16, :result 

    def initialize(deck, board, name, chips)
      puts "class Player initialized ... "
      puts "in class Player ... "

      @deck = deck
      @board = board
      @name = name
      puts "initializing Player ... chips = #{chips}"
      @chips = chips
      @hand = []
      @points = 0

    end

    def place_bet
      print %{
#{name}, you have #{@chips} chips left. What is your bet for this round? 
Enter chips in multiples of 20 (maximum of 100). Do not exceed your 
available chips! }
      until [20, 40, 60, 80, 100].include? (@bet = gets.chomp.to_i) \
        and @bet <= @chips
        print "Incorrect amount - try again: "
      end
      @chips -= @bet
      puts "You have #{@chips} chips left." #test
    end

#  begin from @game.continue_round

    def players_continue
      puts "\n#{@name}'s turn ..."
      loop do 
        @blackjack, @bust, @bust_with_ace = false, false, false
        blackjack? || bust_with_ace? || bust?
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

# begin from @game.results

    def win
      @chips += @bet * 2 # return bet plus winnings
      @result = "win"
    end

    def win_blackjack
      @chips += (@bet * 2.5).to_i # return bet plus winnings
      @result = "win_blackjack"
    end

    def lose
      # @chips remain the same because @bet has already been deducted when bet placed
      puts "in lose ... You have #{@chips} chips left."
      @result = "lose"
      @result = "game lost" if @chips == 0
    end

    def stand_off
      @chips += @bet # return bet
      @result = "stand-off"
    end

# end from @game.results










  end # class Player
end # module Blackjack 
   





