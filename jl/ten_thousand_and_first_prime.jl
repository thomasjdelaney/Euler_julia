# What is the 10001st prime number?

function main(n)
  i = 1
  prime_list = []
  while length(prime_list) < n
    prime_list = primes(i)
    i *= 10
  end
  println("Answer: ", prime_list[n])
end

println("Time: ", @elapsed main(10001))
