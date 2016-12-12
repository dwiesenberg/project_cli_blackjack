# Blackjack

# class Board

module Blackjack
  class Board

    def initialize
      puts "class Board initialized ... "
      puts "in class Board ... "
    end

    def board_copy(dealer, player)
      @dealer = dealer # not array
      @player = player # array - this is where it is stored
    end

    def render_bets
      puts "\nBets Placed"
      puts "-" * 11
#  @players.each do |player|
      puts "#{@player.name.ljust(12, padstr = " ")}: #{@player.bet} chips. Available chips = #{@player.chips}."
#   end
    end

    def dealer_render_layout_note
      if @dealer.hand.length == 1
        puts %{
Note: dealer's points are for only his FIRST card until his turn at 
end of round. 
          } # note: program deals out dealer's second card then
      end
    end

    def render_layout
      puts "\nLatest Results"
      puts "-" * 14
      print @dealer.name.ljust(12, padstr = " "), ": ", @dealer.points, " "
      render_layout_notes(@dealer)
#      @players.each do |player|
      print @player.name.ljust(12, padstr = " "), ": ", @player.points, " "
      render_layout_notes(@player)
#      end
    end

    def render_layout_notes(person)
      @person = person
      case
      when person.blackjack
        puts "Blackjack!"
      when person.bust
        puts "Bust!" 
      else
        render_layout_aces    
      end
    end

    def render_layout_aces      
      @person.hand.each do |card|
        if card[:value] == 11 || card[:value] == 1
          puts "Includes ace at #{card[:value]} point(s)."
        else
          puts # new line if no notes
        end
      end
      puts "As score had been over 21, one ace was reset to 1 point. "   if @person.bust_with_ace == true 
      puts "As score had been 17 or over, one ace was reset to 1 point. " if @person.ace_with_over_16 == true
    end

    def render_results
      puts "\nResults"
      puts "-" * 7
# @players.each do |player|
# @player = player

      case @player.result
      when "win"
        puts "#{@player.name.ljust(12, padstr = " ")}: wins #{@player.bet} chips. Available chips = #{@player.chips}."
      when "win_blackjack"
        puts "#{@player.name.ljust(12, padstr = " ")}: wins #{(@player.bet * 1.5).to_i} chips. Available chips = #{@player.chips}."
      when "lose"
        puts "#{@player.name.ljust(12, padstr = " ")}: loses #{@player.bet} chips. Available chips = #{@player.chips}."
      when "game lost"
        puts "#{@player.name.ljust(12, padstr = " ")}: loses #{@player.bet} chips."
        puts "No chips left. Game lost. Better luck next time!"
#          remove_player - only with multiple players
      when "stand-off"
        puts "#{@player.name.ljust(12, padstr = " ")}: has a stand-off (draw) and gets back bet of #{@player.bet} chips. Available chips = #{@player.chips}."
      end

#      at end of palyers loop: puts "\n\nPlayers whose names are missing have lost the game."
    end

    def remove_player
# @players.each do |player|
# @player = player      
# @players.delete_if { |player| player.result == "game lost" }
    end



          

















  end # class Board
end # module Blackjack 
   