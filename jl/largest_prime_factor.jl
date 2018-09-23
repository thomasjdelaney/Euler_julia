# What is the largest prime factor of the number 600851475143?

function divide_by_prime(product, prime)
  # returns only integers
  res = product/prime
  if isinteger(res)
    return round(Int, divide_by_prime(res, prime))
  else
    return product
  end
end

function next_prime(prime)
  have_next = false
  i = 0
  near_prime = 0
  while !have_next
    near_primes = primes(prime + 1 + (100i), prime + (100(i + 1)))
    if length(near_primes) > 0
      near_prime = minimum(near_primes)
      have_next = true
    end
    i += 1
  end
  return near_prime
end

function get_largest_prime_factor(product)
  res_is_prime = false
  hundred_primes = primes(100)
  prime = 2
  while !res_is_prime
    product = divide_by_prime(product, prime)
    res_is_prime = isprime(product)
    prime = next_prime(prime)
    if prime > product
      println("Epic fail: prime = $prime, product = $product.")
      return 0
    end
  end
  println("Highest prime factor is $product.")
end

println(@elapsed get_largest_prime_factor(600851475143))

println(@elapsed println(first(maximum(factor(600851475143)))))
