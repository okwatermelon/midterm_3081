require_relative 'card'
require_relative 'deck'
require_relative 'hand'
class Player
    attr_reader :pot, :hand
    def initialize(pot, hand)
        @pot = pot
        @hand = hand
    end
    def hand=(new_hand) #updates hand
        @hand = new_hand
    end
    def add_to_pot(num) #adds to pot
        @pot += num
    end
    def discard(place, deck) #discards
        @hand.delete1(place)
        @hand.add1(deck.pop)
    end
    def discard_start(deck) #starts discard process up to 3
        puts "How many cards would you like to discard? (up to 3)"
        input = gets.chomp.to_i
        if input > 3 || input < 0
            puts "Invalid input, try again"
            discard_start
        end
        if input == 0
            return 0
        end
        input.times do
            puts "Which card would you like to discard? (position of card)"
            card_index = gets.chomp.to_i
            discard(card_index, deck)
        end
    end
    def turn(current_bet) # handles players turn
        puts "fold see or raise?, you have #{@pot} chips, the current bet is #{current_bet}"
        puts @hand.cards.display
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
            puts "Invalid Input, folding"
            hand = []
        end
        current_bet
    end
end