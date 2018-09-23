# If we list all the natural numbers below 10 that are multiples of 3 or 5, 
#  we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

function multiples_to_limit(factor, limit)
    multiples = [];
    i = 0;
    multiple = 0;
    while multiple < limit
        i += 1
        multiple = i * factor
        if multiple < limit
            push!(multiples, multiple)
        end
    end
    return multiples
end

three = multiples_to_limit(3, 1000);
five = multiples_to_limit(5, 1000);

println(@elapsed sum(unique(vcat(multiples_to_limit(3, 1000), multiples_to_limit(5, 1000)))))

function main()
    tot = sum([x%3==0 || x%5==0 ? x : 0 for x=1:999])
    println(tot)
end

println(@elapsed main())
