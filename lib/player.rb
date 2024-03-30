require 'card'
require 'deck'
require 'hand'
class Player
    attr_reader :pot, :hand
    def initialize(pot, hand)
        @pot = pot
        @hand = hand
    end
    def discard(place, deck)
        @hand.delete1(place)
        @hand.add1(deck.deal)
    end
    def discard_start(deck)
        puts "How many cards would you like to discard? (up to 3)"
        input = gets.chomp.to_i
        if input > 3 || input < 1
            puts "Invalid input, try again"
            discard_start
        end
        input.times do
            puts "Which card would you like to discard? (position of card)"
            card_index = gets.chomp.to_i
            discard(card_index, deck)
        end
    end
    def turn(current_bet)
        puts "fold see or raise?"
        input = gets.chomp
        if input == 'fold'
            @hand = []
        elsif input == 'see'
            if @pot < current_bet
                puts "not enough chips to bet, folding"
                @hand = []
            else
                @pot -= current_bet
            end
        elsif input == 'raise'
            puts "Enter raise amount"
            num = gets.chomp.to_i
            if @pot < current_bet + num
                puts "not enough chips to raise, folding"
                @hand = []
            else
                @pot -= current_bet + num
                current_bet += num
            end
        else
            puts "Invalid Input, try again"
            turn(current_bet)
        end
    end
end