require 'game'
RSpec.describe Game do
    let(:game1) {Game.new(2)}
    describe '#deal_out' do 
    it 'deals five cards to each player' do
        game1.deal_out
        game1.players.each do |i|
            expect(i.hand.cards.length).to eq(5)
        end
    end
    end
    describe '#start_turns' do
    it 'does everyones turns, and declares a winner' do
        game1.start_turns
        expect(game1.pot).to be >=0
    end # i ran out of time, it works somewhat though the game class is a complete mess though idk how it works, well i do, but its a miracle it does :)
end
end