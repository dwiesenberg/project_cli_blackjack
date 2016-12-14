# Blackjack

# program collector

# require './blackjack_game'
# require './blackjack_board'
# require './blackjack_participant'
# require './blackjack_dealer'
# require './blackjack_player'
# require './blackjack_deck'

# require 'pry'
# require 'pry-byebug'

require './game'
require './board'
require './participant'
require './dealer'
require './player'
require './deck'

# require './test' # test

# Includes the Blackjack
# module into the global
# namespace
include Blackjack


# Play!

puts "\nReady to play ... please wait"
sleep(1)

Game.new.play


