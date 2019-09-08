class Image
 
	def initialize(img, distance)
		@image = img
		@image2 = img.map(&:clone)
		@distance = distance
	end
 
	def blur(distance)
 		@blur = distance
 		@count = 1
 
		while @count <= @blur && @blur != 0
 
			@image = @image2.map(&:clone)
			@count = @count + 1
 
			@image.each.with_index do |num, index|
				idx = index
 
				num.each.with_index do |num2, index|
					if num2 == 1
						sub_idx = index
 
						if @image2[idx - 1][sub_idx] != nil 
							if idx - 1 >= 0 
								@image2[idx - 1][sub_idx] = 1
							end
						end
						if @image2[idx][sub_idx - 1] != nil 
							@image2[idx][sub_idx - 1] = 1
						end
						if @image2[idx][sub_idx + 1] != nil
							@image2[idx][sub_idx + 1] = 1
						end
						if @image2[idx + 1] != nil
							@image2[idx + 1][sub_idx] = 1
						end
					end
				end
			end 
		end
	end
 
	def output_image 
 
		blur(@distance)
		@image2.each do |array|
			puts array.join(' ')
		end
	end
	
end

print "Blur Distance: "
distance = gets.to_i

image = Image.new([
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 1, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 1]
], distance)

image.output_image