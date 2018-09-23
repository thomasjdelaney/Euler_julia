# Find the difference between the sum of the squares of the first
# one hundred natural numbers and the square of the sum.

function sum_of_squares()
  return sum([x^2 for x=1:100])
end

function square_of_sum()
  return sum(1:100)^2
end

function main()
  println("Answer: ", square_of_sum() - sum_of_squares())
end

function alt_main()
    sumsquares = 0
    sum = 0
    for i = 1:100
        sum += i
        sumsquares += i^2
    end
    println("Alt Answer: ", sum^2 - sumsquares)
end

println("Time: ", @elapsed main())
println("Alt Time: ", @elapsed alt_main())
# Alt is faster because it loops through 1:100 only once.
