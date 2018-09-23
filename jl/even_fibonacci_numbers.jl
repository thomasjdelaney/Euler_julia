# By considering the terms in the Fibonacci sequence 
# whose values do not exceed four million, find the sum of the even-valued terms.

function even_fibonacci_generator(limit)
    total = 0
    last_two = [0, 1]
    next_fib = 0
    while next_fib < limit
        next_fib = sum(last_two)
        last_two = [pop!(last_two)]
        push!(last_two, next_fib)
        if next_fib%2 == 0
            total += next_fib
        end
    end
    return total
end

function main()
    println(even_fibonacci_generator(4000000))
end

println(@elapsed main())


    
