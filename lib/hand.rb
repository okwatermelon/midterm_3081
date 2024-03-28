require 'card'
require 'deck'
class Hand
    attr_reader :hand
    def initialize(hand)
        @hand = hand
    end
    def hand_strength
        if royal_flush
            return 10
        elsif straight_flush
            return 9
        elsif four_of_a_kind
            return 8
        elsif full_house
            return 7
        elsif flush
            return 6
        elsif straight 
            return 5
        elsif three_of_a_kind
            return 4
        elsif two_pair
            return 3
        elsif one_pair
            return 2
        else 
            return 1
        end
    end
    def royal_flush
        if @hand.all? {|i| i.suit == @hand[0].suit} && hand.any? {|i| i.rank == 10} && hand.any? {|i| i.rank == 'ace'} && hand.any? {|i| i.rank == 'jack'} && hand.any? {|i| i.rank == 'queen'} && hand.any? {|i| i.rank == 'king'} 
            return true
        end
    end
    def straight_flush
        sort = @hand.sort_by {|i| i.rank_value}
        required_num = sort.first.rank_value
        required_num += 4
        if @hand.all? {|i| i.suit == @hand[0].suit} && required_num == sort.last.rank_value && sort.uniq.length == 5
            return true
        elsif @hand.all? {|i| i.suit == @hand[0].suit} && hand.any? {|i| i.rank == 'ace'} && hand.any? {|i| i.rank == 2} && hand.any? {|i| i.rank == 3} && hand.any? {|i| i.rank == 4} && hand.any? {|i| i.rank == 5}
            return true # accomodating for case when ace = 14 doesnt work
        end
    end
    def four_of_a_kind
        count = 0
        ranks = []
        5.times do
            ranks.append(@hand[count].rank)
            count += 1
        end
        if ranks.any? { |i| ranks.count(i) == 4}
            return true
        end
    end
    def full_house
        count = 0
        ranks = []
        5.times do
            ranks.append(@hand[count].rank)
            count += 1
        end
        unique = ranks.uniq
        if unique.length() == 2
            return true
        end
    end
    def flush
        if @hand.all? {|i| i.suit == @hand[0].suit}
            return true
        end
    end
    def straight
        sort = @hand.sort_by {|i| i.rank_value}
        required_num = sort.first.rank_value
        required_num += 4
        if required_num == sort.last.rank_value && sort.uniq.length == 5
            return true
        elsif hand.any? {|i| i.rank == 'ace'} && hand.any? {|i| i.rank == 2} && hand.any? {|i| i.rank == 3} && hand.any? {|i| i.rank == 4} && hand.any? {|i| i.rank == 5}
            return true # for when ace is the low number
        end
    end
    def three_of_a_kind
        count = 0
        ranks = []
        5.times do
            ranks.append(@hand[count].rank)
            count += 1
        end
        if ranks.any? { |i| ranks.count(i) == 3}
            return true
        end
    end
    def two_pair
        count = 0
        ranks = []
        5.times do
            ranks.append(@hand[count].rank)
            count += 1
        end
        if ranks.any? { |i| ranks.count(i) == 2} && ranks.uniq.length == 3
            return true
        end
    end
    def one_pair 
        count = 0
        ranks = []
        5.times do
            ranks.append(@hand[count].rank)
            count += 1
        end
        if ranks.any? { |i| ranks.count(i) == 2} && ranks.uniq.length == 4
            return true
        end
    end
    def versus(hand2)
        high_card1 = @hand.max_by { |i| i.rank_value}
        high_card2 = hand2.hand.max_by { |i| i.rank_value}
        hand1_strength = hand_strength
        hand2_strength = hand2.hand_strength
        if hand1_strength > hand2_strength
            return 1
        elsif hand2_strength > hand1_strength
            return 2
        else
            if high_card1.rank_value > high_card2.rank_value
                return 1
            elsif high_card2.rank_value > high_card1.rank_value
                return 2
            else
                puts 'how did you get here'
            end
        end
    end
end