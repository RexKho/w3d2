class Player
    def initialize
    
    end

    def get_input(valid_positions)
        begin
            puts "Please enter a position"
            input = gets.chomp.split(" ")
            input[0],input[1] = input[0].to_i, input[1].to_i
            raise RuntimeError.new unless valid_position.include?(input)
            return input
        rescue
            puts "Sorry! That is not a valid position."
            retry
        end
    end
end