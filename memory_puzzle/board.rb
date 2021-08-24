class Board
    def initialize(num)
        raise "Number must be even" if num.odd?
        @grid = Array.new(num){Array.new(num,"_")}
        @length = num
    end

    def populate

        ((@length ** 2) / 2).times do
            value = Card.generate_value
            2.times do
                add_card(valid_position, Card.new(value))
            end
            # assign 1st of pair to random_position (if empty)

            # assign 2nd of pair to random_position (if empty)
        end


    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        @grid[row][col] = value
    end

    def add_card(position, card)
        self[position] = card.value
    end

    def valid_position
        position = random_positon
        unless position_empty?(position)
            position = random_positon
        end
        position
    end

    def random_positon
        row = (0...@length).to_a.sample
        col = (0...@length).to_a.sample
        position = [row, col]
    end

    def position_empty?(position)
        row, col = position
        @grid[row][col] == '_'
    end

end