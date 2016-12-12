# Blackjack

# class Deck

# module Blackjack
  class Deck

    attr_reader :drawn_card
    
    RANKS = %w{ A 2 3 4 5 6 7 8 9 10 J Q K}
    SUITS = %w{Spades Hearts Diamonds Clubs}

    def initialize
      puts "class Deck initialized ... "
      puts "in class Deck ... "
      @cards = []
      manufacture_card_deck
    end

    def manufacture_card_deck
      SUITS.each do |suit|
        RANKS.each do |rank|
          if ["J", "Q", "K"].include? (rank)
            value = 10 
          elsif rank == "A"
            value = 11
          else
            value = rank.to_i 
          end
          @cards.push({suit: suit, rank: rank, value: value})
        end
      end
    end      



    def shuffle!
      @cards.shuffle!
    end

    def draw_card
      shuffle!
      @drawn_card = @cards.pop
      @drawn_card
    end

    def remaining
      @cards.length
    end

  end # class Deck

# end # module Blackjack 


