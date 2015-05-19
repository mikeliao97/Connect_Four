require "spec_helper"

module ConnectFour
	describe Board do
	
		context "#initialize" do
			it "initialzies the board with a grid" do
				expect { Board.new( grid: "grid") }.to_not raise_error
			end
			
			it "sets the grid with 6 rows by default" do
				board = Board.new
				expect(board.grid.length).to eq 6
			end
			
			it "creates six  things in each row by default" do
				board = Board.new
				board.grid.each do |row|
					expect(row.length).to eq 7
				end
			end
		end
		
		context "#grid" do
			it "returns the grid" do
				board = Board.new(grid: "blah")
				expect(board.grid).to eq "blah"
			end
		end
		
		context "#get_cell" do
			it "returns the cell based on the x,y coordinate" do
				grid = [["", "", ""], ["", "", "something"], ["", "", ""]]
				board = Board.new(grid: grid)
				expect(board.get_cell(2,1)).to eq "something"
			end
		end
		
		context "#set_cell" do
			it "updates the value of cell object at coordinate" do
				Cat = Struct.new(:value)
				grid = [[Cat.new("cool"), "", ""], ["", "", ""], ["", "", ""]]
				board = Board.new(grid: grid)
				board.set_cell(0, 0, "meow")
				expect(board.get_cell(0,0).value).to eq "meow"
			end	
		end	

		TestCell = Struct.new(:value)
		let(:x_cell) { TestCell.new("X")}
		let(:y_cell) { TestCell.new("Y")}
		let(:empty) { TestCell.new("")}
		
		context "#game_over" do
			it "returns :winner if winner? is true" do
				board = Board.new	
				board.stub(:winner?) {true}
				expect(board.game_over).to eq :winner
			end
			
			it "returns :draw if winner? is false and draw? is true" do
				board = Board.new
				board.stub(:winner?) { false}
				board.stub(:draw?) { true}
				expect(board.game_over).to eq :draw
			end	
			
			it "returns false if winner? is false and draw? is false" do	
				board  = Board.new
				board.stub(:winner?) { false}
				board.stub(:draw?) {false}
				expect(board.game_over).to be_falsey
			end

			it "returns :winner when row has objects with values thare the same"  do
				grid = [
					[x_cell, x_cell, x_cell, x_cell, x_cell, x_cell, x_cell],
					[x_cell, x_cell, x_cell, x_cell, x_cell, x_cell, x_cell],
					[x_cell, x_cell, x_cell, x_cell, x_cell, x_cell, x_cell],
					[x_cell, x_cell, x_cell, x_cell, x_cell, x_cell, x_cell],
					[x_cell, x_cell, x_cell, x_cell, x_cell, x_cell, x_cell],
					[x_cell, x_cell, x_cell, x_cell, x_cell, x_cell, x_cell]
				]
				
				board = Board.new(grid: grid)
				expect(board.game_over).to eq :winner
			end

			it "returns :winner y cells are the same"  do
				grid = [
					[x_cell, x_cell, empty, empty, empty, empty, empty],
					[x_cell, empty, empty, empty, empty, empty, empty],
					[x_cell, empty, empty, empty, empty, empty, empty],
					[x_cell, empty, empty, empty, empty, empty, empty],
					[x_cell, empty, empty, empty, empty, empty, empty],
					[x_cell, empty, empty, empty, empty, empty, empty]
				]
				
				board = Board.new(grid: grid)
				expect(board.game_over).to eq :winner
			end
	
			it "returns winner if the diagonal is 4"  do
				grid = [
					[x_cell, y_cell, x_cell, y_cell, x_cell, y_cell, x_cell],
					[x_cell, y_cell, x_cell, y_cell, x_cell, y_cell, x_cell],
					[x_cell, y_cell, x_cell, y_cell, x_cell, y_cell, x_cell],
					[y_cell, x_cell, y_cell, x_cell, y_cell, x_cell, y_cell],
					[y_cell, x_cell, y_cell, x_cell, y_cell, x_cell, y_cell],
					[y_cell, x_cell, y_cell, x_cell, y_cell, x_cell, y_cell]
				]
				
				board = Board.new(grid: grid)
				expect(board.game_over).to be_truthy
			end
	
			it "returns draw if there are not winners"  do
				grid = [
					[x_cell, empty, empty, empty, empty, empty, empty],
					[x_cell, x_cell, empty, empty, empty, empty, empty],
					[x_cell, empty, x_cell, empty, empty, empty, empty],
					[empty, empty, empty, x_cell, empty, empty, empty],
					[empty, empty, empty, empty, empty, empty, empty],
					[empty, empty, empty, empty, empty, empty, empty]
				]
				
				board = Board.new(grid: grid)
				expect(board.game_over).to be_truthy
			end



		end
			
	end
			
end


