class Array
	def all_empty?
		self.all? { |element| element.to_s.empty? }
	end
	
	def has_four?
		max = 0
		 for i in 0..self.length - 1
			current_element = self[i]
			current_max = 0
			for j in 0..self.length - 1
				if(self[i] == self[j] && self[j] != "")
					current_max += 1
				end	
			end
			
			if(current_max > max)
				max = current_max
			end
		end
		
		puts max
		return max >= 4 ? true : false	
	end
	
	def none_empty?
		!any_empty?
	end
	
	def any_empty?
		self.any? { |element| element.to_s.empty? }
	end
end

