# Evaluate the sum of all the amicable numbers under 10000.

using Utils # includes a properDivisors function

function main()
  to_test = collect(range(1, 10000))
  amicable_sum = 0
  while length(to_test) > 1
    test1 = pop!(to_test)
    test2 = sum(properDivisors(test1))
    if (test1 != test2) && (sum(properDivisors(test2)) == test1)
      amicable_sum = amicable_sum + test1 + test2
      filter!(x -> x != test2, to_test)
    end
  end
  return amicable_sum
end

println("Time: ", @elapsed answer = main())
println("Answer: $answer")
