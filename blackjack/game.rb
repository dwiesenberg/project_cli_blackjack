# Blackjack

# class Game

module Blackjack
  class Game

    def initialize
      puts "class Game initialized ... "
    end

    def play
      set_up
      begin_round
      continue_round
      results
    end

    # begin set_up

    def set_up
      welcome
      setup_deck
      setup_board
      setup_participants
    end

    def welcome

      puts %{ 

WELCOME TO BLACKJACK!

Rules: One or more players play against a dealer. Players attempt to 
beat the dealer's hand without going over 21. All are dealt 2 cards 
(only one of the dealer's cards is shown to start) and may continue 
to "hit" (ask for another card) until they choose to "pass" (stop 
hitting) or "bust" (go over 21). 

In the following, "he/his" is short for "he/she/his/her." 

Some additional rules:

1. Players bet before each round. When a player wins, he is paid 
   equal to his bet.
2. Numbered cards have value equal to their number. Face cards(
   Queen, King, Jack) are all worth 10. Aces count as either 1 or 
   11, whichever is more advantageous.
3. If a player is dealt 21 points from the first two cards, it is a 
   "blackjack" and the payout is 1.5x the bet (versus the normal 1x 
   the bet). This is paid immediately unless the dealer also has a 
   "blackjack", in which case everyone loses immediately.
4. The dealer must hit until his total reaches at least 17, then 
   must pass. If the dealer has at least 17 which in-cludes an ace 
   that could put his points value below 17 (by equaling 1 instead 
   of 11), the ace value is set to 1 and the dealer continues to hit.

      } 

    end

    def setup_deck
      @deck = Deck.new
    end

    def setup_board
      @board = Board.new
    end

    def setup_participants  
      @players = []
      @dealer = Dealer.new(@deck, @board, "Dealer")
      @player = Player.new(@deck, @board, get_player_name, get_player_chips)
#      @initial_players << @player
      @board.board_copy(@dealer, @player)

#      @players << Dealer.new(@deck, get_player_name)
#      @players << Player.new(@deck, get_player_name)
    end

    def get_player_name
      print "What is your name? "
      while "" == (name = gets.chomp)
        print "\nYou did not enter an answer. Try again: "
      end
      name
    end

    def get_player_chips
      puts "How many chips are you bringing to the table?" 
      print "Enter 100, 200, 300, 400, or 500: "
      until [100, 200, 300, 400, 500].include?(amount = gets.chomp.to_i)
        print "\nIncorrect amount - try again: "
      end
      amount
    end

    # end set_up

    # begin begin_round
 
    def begin_round
      place_bets
      @dealer.deal_card
      2.times{@player.deal_card}
      @board.dealer_render_layout_note
    end

    def place_bets
      @player.place_bet 
# TO DO add facility to handle multiple players
      @board.render_bets # after all bets placed
    end

    # end begin_round

    # begin continue_round

    def continue_round
      @player.players_continue
      @dealer.dealer_continues
    end

    # end continue_round

    # begin results

    def results
# TODO apply to all players 
      puts
      dealer_blackjack? || player_blackjack? || player_bust? || dealer_bust? || evaluate_on_points
      @board.render_results
# TODO alter next line for many rounds
      puts "\nThank you for playing!\n\n"
    end

    def dealer_blackjack?
      if @dealer.blackjack
        @player.lose 
        true
      end
    end

    def player_blackjack?
      if @player.blackjack
        @player.win_blackjack 
        true
      end      
    end

    def player_bust?
      if @player.bust
        @player.lose
        true
      end
    end

    def dealer_bust?
      if @dealer.bust
        @player.win
        true
      end
    end

    def evaluate_on_points
      if @dealer.points > @player.points
        @player.lose
      elsif @dealer.points < @player.points
        @player.win
      else
        @player.stand_off
      end
    end


    # end results  


  end # class Game
end # module Blackjack 
