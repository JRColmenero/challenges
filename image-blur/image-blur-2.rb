class Image
    def initialize(img)
        @image = img
        @image2 = img.map(&:clone)
    end
     
    def output_image
    
        @image.each do |num|
            
            num.each do |num2|
                if num2 == 1
                    idx = @image.index(num)
                    sub_idx = num.index(num2)
                    
                    if @image2[idx - 1][sub_idx] != nil
                        @image2[idx - 1][sub_idx] = 1
                    end
                    if @image2[idx][sub_idx - 1] != nil                    
                        @image2[idx][sub_idx - 1] = 1
                    end
                    if @image2[idx][sub_idx + 1] != nil
                        @image2[idx][sub_idx + 1] = 1
                    end
                    if @image2[idx + 1][sub_idx] != nil
                        @image2[idx + 1][sub_idx] = 1
                    end                                  
                end
            end            
        end
      
        @image2.each do |array|
            puts array.join(' ')
        end
        
    end
    
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image