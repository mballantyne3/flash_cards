require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

RSpec.describe Round do
    it 'can be initialized with deck of cards' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        
        round = Round.new(deck)

        expect(round).to be_instance_of(Round)
        expect(round.deck).to be(deck)
    end

    it 'can take a turn' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        
        round = Round.new(deck)

        expect(round.turns).to eq([])
        expect(round.current_card).to eq(card_1)

        new_turn = round.take_turn("Juneau")

        expect(new_turn).to be_instance_of(Turn)
        expect(new_turn.card).to eq(card_1) 
        expect(new_turn.guess).to eq("Juneau")
    
    end
end
