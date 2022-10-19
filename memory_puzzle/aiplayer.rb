class Aiplayer
    def initialize
        @known_cards = Hash.new() {|h, k| h[k] = []}
        @matched_cards = []
        @first_guess = nil
        @second_guess = nil
    end

    def get_input(valid_positions)
        if @second_guess == nil
            #set both guesses
            #return first guess
            #set first guess to nil
        elsif @first_guess == nil
            #return second guess
            #set second guess = nil
        end
    end

    def set_both_guesses(valid_positions)
        pairs = @known_cards.select {|k,v| v.length == 2}
        if pairs.length > 0
            @first_guess = pairs[0][0]
            @second_guess = pairs[0][1]
            @known_cards[]
            return
        end

    end

    def receive_revealed_card(position, value)
        @known_cards[value] << position
    end

    def receive_match(position1, position2)
        @matched_cards << position1 
        @matched_cards << position2
    end

end