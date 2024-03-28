require 'card'
RSpec.describe Card do
    describe '#initialize' do
    it 'makes a card with a selected suit and number' do
        card = Card.new('spades', 'ace')
        expect(card.suit).to eq('spades')
        expect(card.value).to eq('ace')
    end
end
end