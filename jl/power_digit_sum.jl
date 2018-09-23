# What is the sum of the digits of the number 2^1000?

function longAddition(x, y)
  # For adding integers that are too big to be represented as ints
  # args: x, y = string, the numbers to be added
  # return: answer = string, the sum of x and y
  lx, ly = length(x), length(y)
  extended = repeat("0", abs(lx-ly))*[x,y][indmin([lx, ly])]
  lx < ly ? x = extended : y = extended
  l = max(lx, ly)
  answer = ""
  carry = false
  for ii in reverse(1:l)
    xi, yi = parse(Int64, x[ii]), parse(Int64, y[ii])
    zi = xi + yi + (carry ? 1 : 0)
    z = string(zi)[[end]]
    carry = zi > 9
    answer = z*answer
  end
  answer = carry ? "1"*answer : answer
  return answer
end

function main()
  answer = "1"
  for n in 1:1000
    answer = longAddition(answer, answer)
  end
  return sum(map(x -> parse(Int64, x), collect(answer)))
end

println("Time: ", @elapsed answer = main())
println("Answer: $answer")

println("Time: ", @elapsed answer = sum(map(x -> parse(Int64, x), collect(string(BigInt(2)^1000)))))
println("Answer: $answer")
