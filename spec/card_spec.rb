require 'card'
RSpec.describe Card do
    describe '#initialize' do
    it 'makes a card with a selected suit and number' do
        card = Card.new('spade', 'ace')
        expect(card.suit).to eq('spade')
        expect(card.value).to eq('ace')
    end
end
end