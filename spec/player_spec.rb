require 'player'
require 'deck'
RSpec.describe Player do
    let(:player1) {Player.new(50, Hand.new([Card.new('hearts', 10), Card.new('hearts', 'jack'), Card.new('hearts', 'queen'), Card.new('hearts', 'king'), Card.new('hearts', 'ace')]))}
    describe '#discard and #discard_start' do
    it "discards a specified number of cards in specified slot" do
        deck1 = Deck.new
        deck1.shuffle
        allow(player1).to receive(:gets).and_return("3", "1", "2", "3")
        temp_hand = player1.hand
        player1.discard_start(deck1)
        expect(deck1.length()).to eq(49)
    end
end
    describe '#turn' do
    it "empties hand when input is fold" do
        allow(player1).to receive(:gets).and_return('fold')
        player1.turn(50)
        expect(player1.hand).to eq([])
    end
    it "folds when input is see and pot is less than bet" do
    allow(player1).to receive(:gets).and_return('see')
    player1.turn(100)
    expect(player1.hand).to eq([])
    end
    it 'subtracts bet amount from current pot when seeing and pot is enough' do
        allow(player1).to receive(:gets).and_return('see')
        player1.turn(50)
        expect(player1.pot).to eq(0)
    end
    it 'player is able to raise, and chooses raise it will increase bet by raise amount and subtract amount from pot' do
        allow(player1).to receive(:gets).and_return('raise', '30')
        player1.turn(20)
        expect(player1.pot).to eq(0)
    end
    it 'fold when player cannot raise by specified amount' do
    allow(player1).to receive(:gets).and_return('raise', '100')
    player1.turn(50)
    expect(player1.hand).to eq([])
    end
end
end