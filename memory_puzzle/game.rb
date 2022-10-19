require_relative "board.rb"

class Game
    def initialize
        @board = Board.new
        @player = Player.new
    end



    def play 
        until @board.win?
            @board.render 
            valid_positions = @board.get_valid_positions
            position = @player.get_input
            current_card = @board[position]
            if @board.previous_guess.instance_of?(Card) 
                @board.flip(position)
                if current_card == @board.previous_guess
                    
                else
                    @board.previous_guess.flip
                    current_card.flip
                end
                @board.previous_guess = nil
            else
                @board.previous_guess = current_card
                current_card.flip
            end
        end
    end

end