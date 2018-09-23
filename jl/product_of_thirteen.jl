# Find the thirteen adjacent digits in the 1000-digit number that have
# the greatest product. What is the value of this product?

function main(filename)
  # read a file containing a large number
  file_str = readall(filename)
  int_string = [parse(Int, x) for x in file_str[1:end-1]]
  product = 0
  while length(int_string) >=13
    new_product = prod(int_string[1:13])
    product = maximum([product, new_product])
    shift!(int_string)
  end
  println("Answer: ", product)
end

println("Time: ", @elapsed main("/home/thomas/Euler/files/thousand_digit_number.txt"))
