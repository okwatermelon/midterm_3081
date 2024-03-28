class Card
    attr_reader :suit, :rank
    def initialize(suit,rank)
        @suit = suit
        @rank = rank
    end
    def rank_value
        if @rank == 'jack'
            return 11
        elsif @rank == 'queen'
            return 12
        elsif @rank == 'king'
            return 13
        elsif @rank == 'ace'
            return 14
        else
            return @rank
        end
    end
end