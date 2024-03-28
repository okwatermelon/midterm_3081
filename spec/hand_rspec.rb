require 'hand'
RSpec.describe Hand do
    describe '#hand_strength' do
    it 'returns 10 when the given hand is a royal flush' do
        hand = Hand.new([Card.new('hearts', 10), Card.new('hearts', 'jack'), Card.new('hearts', 'queen'), Card.new('hearts', 'king'), Card.new('hearts', 'ace')])
        expect(hand.hand_strength).to eq(10)
    end
    it 'returns 9 when the given hand is a straight flush' do
        hand = Hand.new([Card.new('hearts', 10), Card.new('hearts', 'jack'), Card.new('hearts', 'queen'), Card.new('hearts', 'king'), Card.new('hearts', 9)])
        expect(hand.hand_strength).to eq(9)
    end
    it 'returns 8 when the given hand is a four of a kind' do
        hand = Hand.new([Card.new('hearts', 10), Card.new('spades', 10), Card.new('clubs', 10), Card.new('diamonds', 10), Card.new('hearts', 'ace')])
        expect(hand.hand_strength).to eq(8)
    end
    it 'returns 7 when the given hand is a full house' do
        hand = Hand.new([Card.new('hearts', 10), Card.new('spades', 10), Card.new('clubs', 10), Card.new('diamonds', 4), Card.new('hearts', 4)])
        expect(hand.hand_strength).to eq(7)
    end
    it 'returns 6 when the given hand is a flush' do
        hand = Hand.new([Card.new('hearts', 10), Card.new('hearts', 2), Card.new('hearts', 8), Card.new('hearts', 'ace'), Card.new('hearts', 4)])
        expect(hand.hand_strength).to eq(6)
    end
    it 'returns 5 when the given hand is a straight' do
        hand = Hand.new([Card.new('hearts', 'ace'), Card.new('hearts', 2), Card.new('spades', 3), Card.new('clubs', 4), Card.new('hearts', 5)])
        expect(hand.hand_strength).to eq(5)
    end
    it 'returns 4 when the given hand is a three of a kind' do
        hand = Hand.new([Card.new('hearts', 'ace'), Card.new('spades', 'ace'), Card.new('clubs', 'ace'), Card.new('clubs', 4), Card.new('hearts', 5)])
        expect(hand.hand_strength).to eq(4)
    end
    it 'returns 3 when the given hand is a two pair' do
        hand = Hand.new([Card.new('hearts', 'ace'), Card.new('spades', 'ace'), Card.new('clubs', 4), Card.new('clubs', 9), Card.new('hearts', 4)])
        expect(hand.hand_strength).to eq(3)
    end
    it 'returns 2 when the given hand is a one pair' do
        hand = Hand.new([Card.new('hearts', 'ace'), Card.new('spades', 'ace'), Card.new('clubs', 4), Card.new('clubs', 9), Card.new('hearts', 6)])
        expect(hand.hand_strength).to eq(2)
    end
    it 'returns 1 when the given hand is a high card' do
        hand = Hand.new([Card.new('hearts', 'ace'), Card.new('spades', 2), Card.new('clubs', 4), Card.new('clubs', 9), Card.new('hearts', 10)])
        expect(hand.hand_strength).to eq(1)
    end
end
    describe '#versus' do
    it 'puts two hands against each other and returns 1 if the first hand is stronger, or 2 if second hand is stronger' do
        hand1 = Hand.new([Card.new('hearts', 'ace'), Card.new('spades', 2), Card.new('clubs', 4), Card.new('clubs', 9), Card.new('hearts', 10)])
        hand2 = Hand.new([Card.new('hearts', 10), Card.new('hearts', 'jack'), Card.new('hearts', 'queen'), Card.new('hearts', 'king'), Card.new('hearts', 'ace')])
        expect(hand1.versus(hand2)).to eq(2)
    end
    it 'when two hands are equal, hand with highest card wins' do
    hand1 = Hand.new([Card.new('hearts', 'ace'), Card.new('spades', 'ace'), Card.new('clubs', 4), Card.new('clubs', 9), Card.new('hearts', 6)])
    hand2 = Hand.new([Card.new('hearts', 8), Card.new('spades', 8), Card.new('hearts', 4), Card.new('spades', 9), Card.new('clubs', 6)])
    expect(hand1.versus(hand2)).to eq(1)
    end
end
end