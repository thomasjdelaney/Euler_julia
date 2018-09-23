# Find the maximum total from top to bottom of the triangle in small_triangle.txt

function addTwoRows(r, s)
  # add the rows r and s, returning the sum of the optimal additions
  # args:   r = Array{Int64, 1}, length n
  #         s = Array{Int64, 1}, length n-1
  # return: Array{Int64}, length n-1
  new_row = zeros(Int64, length(s))
  for ii in 1:length(s)
    new_row[ii] = maximum(s[ii] + r[ii:ii+1])
  end
  return new_row
end

function main()
  string_triangle = readlines(homedir()*"/Euler/files/small_triangle.txt")
  triangle = [map(x -> parse(Int64, x), split(replace(l, "\n", ""), " ")) for l in string_triangle]
  new_row = addTwoRows(triangle[end], triangle[end-1])
  for n in range(length(triangle)-2, -1, length(triangle)-2)
    new_row = addTwoRows(new_row, triangle[n])
  end
  return new_row
end

println("Time: ", @elapsed answer = main())
println("Answer: $answer")
