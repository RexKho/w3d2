require_relative "card.rb"

class Board
    attr_reader :grid
    attr_accessor :previous_guess
    def initialize
        @width = 4
        @height = 4
        @grid = Array.new(@width) {Array.new(@height)}
        @values = ["A","B","C","D","E","F","G","H"]
        populate
        @previous_guess = nil
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def populate
        8.times do
            empty_positions = get_empty_positions
            new_pair = assign_card_value
            positions = empty_positions.sample(2)
            (0..1).each do |i|
                self[positions[i]] = new_pair[i]
            end
        end

    end

    def get_empty_positions
        res = []
        (0...@width).each do |i|
            (0...@height).each do |j|
                res << [i,j] unless @grid[i][j].instance_of?(Card)
            end
        end
        return res
    end

    def get_valid_positions
        res = []
        (0...@width).each do |i|
            (0...@height).each do |j|
                res << [i,j] unless @grid[i][j].face_up
            end
        end
        return res
    end

    def assign_card_value
        value = @values.pop
        card_1 = Card.new(value)
        card_2 = Card.new(value)
        return [card_1, card_2]
    end

    def render
        @grid.each do |row|
            row.each do |el|
                print "#{el.face_up? ? el.value : " "} "
            end
            puts
        end
        return true
    end

    def flip(pos)
        return unless valid_position?(pos)
        self[pos].flip
    end

    def win?
        @grid.each do |row|
            row.each do |ele|
                return false unless ele.face_up
            end
        end
        return true
    end

    def valid_position?(pos)
        return false if pos[0] >= @grid.length || pos[0] < 0
        return false if pos[1] >= @grid.length || pos[1] < 0
        return true
    end

end