module ConnectFour
  class Board
    attr_reader :grid
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
		
    end
 
    def get_cell(x,y)
	@grid[x][y]
   end
	
	def set_cell(x, y, value)
		get_cell(x,y).value = value
	end

	def game_over
		return :winner if winner?
		return :draw if draw?
		return false
	end
	
	def formatted_grid
		puts "    1   2   3   4   5   6   7"
		for i in 0..5 
			print i + 1
			for j in 0..6
				print "   #{get_cell(i, j).value}"
			end
			puts ""
	
		end
	end

	def set_diagonal_to_value(arr, value)
		arr.each do |coordinates|
			set_cell(coordinates[0], coordinates[1], value)
		end

	end
    private
 
    def default_grid
      Array.new(6) { Array.new(7) { Cell.new } }
    end
	
	def draw?
		grid.flatten.map { |cell| cell.value }.none_empty?
	end	

	def winning_positions
		grid + grid.transpose + diagonals
	end	
		
	def diagonals
	[
		#there are 12 diagonals that could potentially win in a 7 x 6 board
		#these are the ones that span across from the right
		[get_cell(0,3), get_cell(1,4), get_cell(2,5), get_cell(3, 6)],
		[get_cell(0,2), get_cell(1,3), get_cell(2,4), get_cell(3,5), get_cell(4,6)],
		[get_cell(0,1), get_cell(1,2), get_cell(2,3), get_cell(3,4), get_cell(4,5), get_cell(5,6)],
		[get_cell(0,0), get_cell(1,1), get_cell(2,2), get_cell(3,3), get_cell(4,4), get_cell(5,5)],
		[get_cell(1,0), get_cell(2,1), get_cell(3,2), get_cell(4,3), get_cell(5,4) ]
			
		#

	]
	end
		
	def winner?
		winning_positions.each do |position|
			puts winning_position_values(position).inspect
			puts "****************"
			puts "wet" if winning_position_values(position).all_empty?
			return true if winning_position_values(position).has_four?
		end
		return false
	end
		
	def winning_position_values(winning_position)
		winning_position.collect {|cell| cell.value}	
	end
		
	end	
end



