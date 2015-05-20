
module ConnectFour
  class Game
    attr_reader :players, :board, :current_player, :other_player
    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end
	
    def switch_players
  	@current_player, @other_player = @other_player, @current_player
    end
	
    def solicit_move
	"#{current_player.name}: Enter a number between 1 and 7"
    end
	
    def get_move(human_move = gets.chomp)
		check_available_move(human_move)
    end
    
    def game_over_message 
	return "#{current_player.name} won!" if board.game_over == :winner
	return  "The game ended in a tie" if board.game_over == :draw
    end


    def play
	puts "#{current_player.name} has randomly been selected as the first player"
	while true
		@board.formatted_grid
		puts ""
		puts solicit_move
		x,y = get_move
		puts "This is x: #{x}"
		puts "This is y: #{y}"
		@board.set_cell(x,y, current_player.color)
		if @board.game_over != false
			puts @board.game_over
			puts game_over_message
			@board.formatted_grid
			return
		else	
			puts "Switch!"
			switch_players
		end	
	end		

    end


    private
		
	
    def check_available_move(move)
	for i in 5.downto(0)
		puts board.get_cell(i, move.to_i - 1)
		if(board.get_cell(i, move.to_i - 1).value == "Z")
			return [i, move.to_i - 1]
		end	
	end

    end
  end
end
