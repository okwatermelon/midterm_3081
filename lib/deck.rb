require_relative 'card'
class Deck
    attr_reader :deck
    def initialize
        @deck = []
        ranks = ['ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king']
        suits = ['spades', 'hearts', 'diamonds', 'clubs']
        suits.each do |suit|
            ranks.size.times do |i|
                deck << Card.new(ranks[i], suit)
            end
        end
    end
    def length #added this to make other rspec tests easier to verify
        @deck.length()
    end
    def shuffle #shuffles the deck
        @deck.shuffle
    end
    def deal #removes a card from the deck
        @deck.pop
    end
end