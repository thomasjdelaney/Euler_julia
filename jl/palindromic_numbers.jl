# Find the largest palindrome made from the product of two 3-digit numbers

using Primes

function prefix_take(number_length)
  # find the largest possible number which is a product of two n digit numbers
  largest_possible = parse(Int, repeat("9", number_length))^2
  str_lp = string(largest_possible)
  llp = length(str_lp)
  take_letters = floor(Int, llp/2)
  prefix = parse(Int, str_lp[1:llp-take_letters])
  return prefix, take_letters
end

function test_palindrome(palin)
  # get the prime factors
  prime_factors = sort([first(x)^last(x) for x=factor(palin)], rev=true)
  small_product = pop!(prime_factors) * shift!(prime_factors)
  while length(string(small_product)) < 3
    small_product *= pop!(prime_factors)
  end
  large_product = prod(prime_factors)
  return small_product, large_product
end

function main(number_length)
  prefix, take_letters = prefix_take(number_length)
  answer = 0
  have_answer = false
  while !have_answer
    # make the number to test out of prefix and take
    str_pre = string(prefix)
    palin = parse(Int, string(str_pre, reverse(str_pre)[1:take_letters]))
    small_product, large_product = test_palindrome(palin)
    if length(string(small_product)) == number_length & length(string(large_product)) == number_length
      println("Number: $palin")
      println("Products: $small_product, $large_product")
      have_answer = true
    else
      prefix -= 1
    end
    if number_length > length(string(prefix))
      println("Searched all $number_length number combinations...")
      return 0
    end
  end
end

println(@elapsed main(3))
