require_relative 'player'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'
class Game
    attr_reader :deck, :players, :pot, :current_bet
    def initialize(player_count)
        deck1 = Deck.new
        @deck = deck1.shuffle
        @players = []
        @pot = 0
        @current_bet = 0
        player_count.times do
            @players << Player.new(2000, Hand.new(deal_out))
        end
    end
    def deal_out #deals hands to everyone
        hand = []
        @deck.shuffle
        5.times do
            hand << @deck.pop
        end
        return hand
    end
    def start_turns #handles the turns of everyone and declares winner
        @players.each do |i|
            puts "your turn #{i}"
            @current_bet = i.turn(@current_bet)
            if i.hand != []
                @pot += @current_bet
            end
        end
        @players.each do |i|
            next if i.hand == []
            i.discard_start(@deck)
        end
        @players.each do |i|
            next if i.hand == []
            puts "your turn #{i}"
            @current_bet = i.turn(@current_bet)
            @pot += @current_bet
        end
        not_folded = []
        @players.each do |i|
            if i.hand == []
                next
            else
                not_folded << i
            end
        end
        winner = not_folded.first
        not_folded.each do |i|
            if i.hand.versus(winner.hand) == 1
                winner = i
            elsif i.hand.versus(winner.hand) == 2
                winner = winner
            end
        end
        puts @pot
        winner.add_to_pot(@pot)
        puts "YOU ARE WINNER, #{winner}"
        start_again
    end
    def start_again #starts the game again
        deck1 = Deck.new
        @deck = deck1.shuffle
        @players.each {|i| i.hand = Hand.new(deal_out)}
        @pot = 0
        @current_bet = 0
        start_turns
    end
end
game1 = Game.new(2)
game1.start_turns