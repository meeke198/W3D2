require_relative "card"

class Board
    def initialize(num)
        raise "Number must be even" if num.odd?
        @grid = Array.new(num){Array.new(num,"_")}
        @length = num
    end

    def populate

        ((@length ** 2) / 2).times do
            value = Card.generate_value
            while in_grid?(value)
                value = Card.generate_value
            end
            2.times do
                add_card(valid_position, Card.new(value))
                # place_card(Card.new(value))
                # place_card(Card.new(value))
            end
            # @card_1 = Card.new(Card.generate_value)
            # @card_2 = Card.new(@card_1.value)
            # self.add_card(valid_position, @card_1)
            # self.add_card(valid_position, @card_2)
            # assign 1st of pair to random_position (if empty)

            # assign 2nd of pair to random_position (if empty)
        end


    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def add_card(position, card)
        row, col = position
        @grid[row][col] = card
    end

    def valid_position
        position = random_position
        until position_empty?(position)
            position = random_position
        end
        position
    end

    def in_grid?(value)
        @grid.each do |row|
            row.each do |ele|
                return true if ele.instance_of?(Card) && ele.value == value
            end
        end
        false
    end
    
    # def place_card(card)
    #     placed = false
    #     while placed = false
    #         position = random_position
    #         if position == "_"
    #             @grid[position] = card
    #             placed = true
    #         end
    #     end
    # end

    def random_position
        row = (0...@length).to_a.sample
        col = (0...@length).to_a.sample
        position = [row, col]
    end

    def position_empty?(position)
        row, col = position
        @grid[row][col] == '_'
    end

    def render
        @grid.each do |row|
            # arr = []
            puts (row.map do |card|
                if card.face_up
                    card.value
                else
                    "_"
                end
            end
            .join(" "))
        end
    end 

    def won?
        @grid.none? { |row| row.any? { |card| card.face_up == false } }
    end

    def reveal(guessed_pos)
        self[guessed_pos].reveal
        self[guessed_pos].value
    end

    def hide(guessed_pos)
        self[guessed_pos].hide
        self[guessed_pos].value
    end


end

