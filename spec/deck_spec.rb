require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it 'can be initialized with cards' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        
        expect(deck).to be_instance_of(Deck)
        expect(deck.cards).to eq([card_1, card_2, card_3])
        expect(deck.count).to eq(3)
    end

    it 'returns cards of specified category' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        
        expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
        expect(deck.cards_in_category(:Geography)).to eq([card_1])
        expect(deck.cards_in_category("Pop Culture")).to eq([])
    end

end