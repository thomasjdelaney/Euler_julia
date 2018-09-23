# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

function getRequiredFactorials(nn::Int64)
  factorials = Array{Int, 1}()
  i = 2
  while nn/factorial(i) > 1
    append!(factorials, factorial(i))
    i += 1
  end
  return reverse(factorials)
end

function getPermAtIndex(ind::Int64, nn::Int64, factorials::Array{Int64,1}, nums::Array{Int64,1})
  f = factorials[ind]
  moves, next_nn = divrem(nn,f)
  answer_ind = nums[moves+1]
  deleteat!(nums, moves+1)
  return next_nn, answer_ind, nums
end

function main(n)
  nums = [0,1,2,3,4,5,6,7,8,9]
  answer = zeros(nums)
  nn = n-1
  factorials = getRequiredFactorials(nn)
  for ind in 1:length(factorials)
    nn, answer[ind], nums = getPermAtIndex(ind, nn, factorials, nums)
  end
  answer[end-length(nums)+1:end] = nn == 0 ? nums : reverse(nums)
  return answer
end

println("Time: ", @elapsed answer = main(1000000))
println("Answer: $answer")
