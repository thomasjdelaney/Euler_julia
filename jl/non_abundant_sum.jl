# Find the sum of all the positive integers which cannot be written
# as the sum of two abundant numbers.

function isAbundant(n)
  # is n abundant or not?
  sum_of_divisors = 1
  d = 2
  while d*d <= n
    if 0 == mod(n, d)
      sum_of_divisors += d
      if d < n/d
        sum_of_divisors += convert(Int64, n/d)
      end
    end
    d += 1
  end
  return n < sum_of_divisors
end

function main()
  abundant_numbers = Array{Int, 1}()
  [isAbundant(i) && append!(abundant_numbers, i) for i in 1:28122]
  sum_of_abundants = Array{Int, 1}()
  for x in abundant_numbers
    for y in abundant_numbers
      if (y >= x) && (x+y < 28123)
        append!(sum_of_abundants, x+y)
      end
    end
  end
  not_a_sum = setdiff(1:28122, sum_of_abundants)
  return sum(not_a_sum)
end

println("Time: ", @elapsed answer = main())
println("Answer: $answer")
