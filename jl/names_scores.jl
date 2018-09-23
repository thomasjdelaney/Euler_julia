# What is the total of all the name scores in the file names.txt?

function getNames()
  names_from_file = readline("/home/thomas/Euler/files/names.txt")
  return split(replace(names_from_file, "\"", ""), ",", keep=false)
end

function main()
  names = sort(getNames())
  answer = 0
  ii = 1
  for n in names
    answer = answer + ii*sum([Int(l)-64 for l in n])
    ii += 1
  end
  return answer
end

println("Time: ", @elapsed answer = main())
println("Answer: $answer")
