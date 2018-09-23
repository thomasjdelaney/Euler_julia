function fibonacciGenerator(limit)
    last_two = Array{BigInt,1}([0, 1])
    next_fib = BigInt(0)
    index = 1
    while length(string(next_fib)) < limit
        index += 1
        next_fib = sum(last_two)
        last_two = [pop!(last_two)]
        push!(last_two, next_fib)
        print(string(now()), " $index: $next_fib\n")
    end
    return next_fib, index
end

println("Time: ", @elapsed answer = fibonacciGenerator(1000))
println("Answer: $answer")
