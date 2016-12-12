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
      @player = player # array
    end

    def render_layout
      puts "\nLatest Results"
      puts "-" * 14
      first_render_layout_note
      print @dealer.name,  " " * (12 - @dealer.name.length), ":", @dealer.points, " "
      render_layout_notes(@dealer)
#      @players.each do |player|
      print @player.name, " " * (12 - @player.name.length), ":", @player.points, " "
      render_layout_notes(@player)
#      end
    end

    def first_render_layout_note
      if @dealer.hand.length == 1
        puts %{
Note: dealer's points are for only his FIRST card until his turn at 
end of round. 
          } # note: program deals out dealer's second card then
      end
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
















  end # class Board
end # module Blackjack 
   