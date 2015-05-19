require "spec_helper"

describe Array do
	context "#all_empty?" do
		it "returns true if all elements of the Array is empty" do
			expect(["", "", ""].all_empty?).to be_truthy
		end
		
		it "returns false if some of the Array elements are not empty" do
			expect(["", 1, "", :a].all_empty?).to be_falsey
		end	
	
		it "returns treu for an empty array" do
			expect([].all_empty?).to be_truthy
		end
	end
	
	context "#has_four?" do
		it "returns true if all elements of the Array are the same" do
			expect(["A", "A", "A", "A"].has_four?).to be_truthy
		end
		
		it "returns false if some of the Array elements are not the same" do
			expect(["", 1, "", ""].has_four?).to be_falsey
		end
		
		it "returns true for an empty Array" do
			expect([].has_four?).to be_falsey
		end
		
	end
	
	context "#any_empty?" do
		it "returns true if there are no elements in an array" do
			expect([""].any_empty?).to be_truthy
		end
		
		it "returns false if one of the values is empty or false" do
			expect(["", "fdsaf", Object.new]).to be_truthy
		end
	end

	context "#none_empty?" do
		it "returns false if the array has many elements" do
			expect(["A", "fdas", "fads"].none_empty?).to be_truthy
		end
	end

end
