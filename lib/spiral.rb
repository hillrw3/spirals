def spiral(starting_number, size)
  matrix = Array.new(size) { Array.new(size) }
  path = [*starting_number...(size**2 + starting_number)]
  matrix[(size/2)][(size/2)] = path.pop
  matrix[(size/2)][(size/2 -1)] = path.pop
  matrix[0] = path.shift(size)
  matrix[-1] = path.pop(size).reverse
  matrix = matrix.each_with_index do |row, i|
    row.each_with_index { |number, index| matrix[i][index] = path.shift if number == nil }
  end
  matrix.each {|row| puts row}
end

p spiral(1, 3)


#FOUND ONLINE
def spiral_matrix(n)
  matrix = Array.new(n) { Array.new(n) }
  path = [*1..n*n]
  padding = (n*n).to_s.size
  layer = 0
  until path.empty?
    matrix[layer].map! { |l| l || path.shift }
    matrix = matrix.transpose.reverse
    layer += 1 unless matrix[layer].include?(nil)
  end
  matrix = matrix.transpose.reverse until matrix[0][0] == 1
  matrix.transpose.each do |row|
    row.each do |l|
      print "%0#{padding}d" % l, ' '
    end
    puts
  end
end

# spiral_matrix(2)
