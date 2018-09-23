# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc

function isTriple(a, b, c)
  a < b < c || return false
  return a^2 + b^2 == c^2
end

function main()
  # initialise the triple
  for c=3:999
    for b=2:c
      for a=1:b
        if a+b+c == 1000
          if isTriple(a, b, c)
            println("Answer: Triple = ", [a,b,c], ", Product = ", prod([a,b,c]))
            return 0
          end
        end
      end
    end
  end
end

println("Time:", @elapsed main())
