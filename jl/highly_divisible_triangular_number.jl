# What is the value of the first triangle number to have over five hundred divisors?

using Primes

function getNthTriNumFactors(n)
  tri_num = convert(Int, n*(n+1)/2)
  factor_dict = merge(factor(n), factor(n+1))
  factor_dict[2] = factor_dict[2] - 1
  return [tri_num, prod(1 + collect(values(factor_dict)))]
end

function main()
  n, l, tri = 0, 0, 0
  while l <= 500
    n += 1
    tri, l = getNthTriNumFactors(n)
  end
  return tri
end

println("Time: ", @elapsed main())
println("Answer: ", string(main()))
