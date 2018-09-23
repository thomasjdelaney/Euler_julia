using Primes

limit = 1000
primes_less_than_limit = primes(6,limit)

function factors(n::Int)
  factor_array = [one(n)]
  for (power,exponent) in factor(n)
    factor_array = reduce(vcat, factor_array, [factor_array*power^j for j in 1:exponent])
  end
  return length(factor_array) == 1 ? [one(n), n] : sort!(factor_array)
end
                           
function multorder(a::Int, m::Int)
  gcd(a,m) == 1 || error("$a and $m are not coprime")
  multi_order = one(m)
  for (power,exponent) in factor(m)
    m = power^exponent
    t = div(m, power) * (power-1)
    for f in factors(t)
      if powermod(a, f, m) == 1
        multi_order = lcm(multi_order, f)
        break
      end
    end
  end
  return multi_order
end

repeating_lengths = [multorder(10, p) for p in primes_less_than_limit]
maximum(repeating_lengths)
