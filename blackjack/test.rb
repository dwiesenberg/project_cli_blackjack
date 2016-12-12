


    def dealer_continues
      loop do
        @blackjack, @bust = true, 
        break if @blackjack || @bust || next_move == "P"
        puts "after break"
      end
    end

    def next_move
      print "\n\n#{@name}: do you want to hit or pass (H or P)? "
      until %w(H P).include? (answer = gets.chomp)
        print "Incorrect answer - try again: "
      end
      answer
    end

    dealer_continues
    puts @bust, @blackjack



