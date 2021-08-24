require_relative "board"
require_relative "player"

class Game

    attr_reader :board

    def initialize(board_size)
        @board = Board.new(board_size)
        @player = Player.new
        @board.populate
    end

    def play
        until @board.won?
            @board.render
            first_guess = @player.get_position
            @board.reveal(first_guess)
            @board.render
            second_guess = @player.get_position
            @board.reveal(second_guess)
            @board.render
            if @board[first_guess].value != @board[second_guess].value
                sleep(1)
                @board.hide(first_guess)
                @board.hide(second_guess)
            end
            system("clear")
            puts
            puts
        end
        puts "You won!"
    end

end