# What is the smallest positive number that is evenly divisible by
# all of the numbers from 1 to 20

# divisible by 20 => divisible by 2, 5
# divisible by 18 => divisible by 3,
# divisible by 14 => 7

function isDivisible(test_num)
  return reduce(&, [isinteger(test_num/x) for x=1:20])
end

function main()
  largest = prod([20; 18; 14; primes(10, 20)])
  # divide by each 1:20 and test if it's stil divisible
  for i=2:20
    test_num = largest/i
    if isDivisible(test_num)
      largest = test_num
    end
  end
  println("Answer: $largest")
end

println("Time: ", string(@elapsed main()))
