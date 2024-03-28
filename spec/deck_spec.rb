require 'deck'
RSpec.describe Deck do
    describe '#initialize' do
    it 'makes a new deck of cards (52)' do
        new_deck = Deck.new
        expect(new_deck.deck.length()).to eq(52)
    end
end
    describe '#shuffle' do
    it 'shuffles the deck' do
        new_deck = Deck.new
        temp_deck = Deck.new
        new_deck.shuffle
        expect(new_deck.deck).not_to eq(temp_deck.deck)
    end
end
    describe '#deal' do
    it 'deals a card from the deck' do
        new_deck = Deck.new
        new_deck.deal
        expect(new_deck.deck.length()).to eq(51)
    end
end
end