# Blackjack

# program collector

require './game'
require './board'
require './participant'
require './dealer'
require './player'
require './deck'

# Includes the Blackjack
# module into the global
# namespace
include Blackjack


# Play!

puts "\nReady to play ... please wait"
sleep(1)

Game.new.play


