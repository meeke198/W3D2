class Player


    def get_position
        puts "Please enter a position in the format '0 0'"
        position = gets.chomp.map(&:to_i)
    end

end