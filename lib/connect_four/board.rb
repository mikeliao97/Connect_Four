module ConnectFour
  class Board
    attr_reader :grid
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end
 
    def get_cell(x,y)
	grid[y][x]
   end
	
	def set_cell(x, y, value)
		get_cell(x,y).value = value
	end

	def game_over
		return :winner if winner?
		return :draw if draw?
		false
	end
	
	def formatted_grid
		puts @grid
	end

    private
 
    def default_grid
      Array.new(6) { Array.new(7) { Cell.new } }
    end
	
	def draw?
		grid.flatten.map { |cell| cell.value }.none_empty?
	end	

	def winning_positions
		grid +
		grid.transpose +
		diagonals
	end	
		
	def diagonals
	[
		#there are 6 diagonals that could potentially win in a 7 x 6 board
		[get_cell(0,2), get_cell(1,3), get_cell(2,4), get_cell(3,5)],
		[get_cell(0, 1), get_cell(1,2), get_cell(2,3), get_cell(3,4), get_cell(4,5)],
		[get_cell(0,0), get_cell(1,1), get_cell(2,2), get_cell(3,3), get_cell(4,4), get_cell(5,5)],
		[get_cell(1,0), get_cell(2,1), get_cell(3,2), get_cell(4,3), get_cell(5,4), get_cell(6,5)],
		[get_cell(2,0), get_cell(3,1), get_cell(4,2), get_cell(5,3), get_cell(6,4)],
		[get_cell(3,0), get_cell(4,1), get_cell(5,2), get_cell(6,3)]
		
	]
	end
		
	def winner?
		winning_positions.each do |position|
			next if winning_position_values(position).all_empty?
			return true if winning_position_values(position).has_four?
		end
	end
		
	def winning_position_values(winning_position)
		winning_position.map {|cell| cell.value}	
	end
		
	end	
end
