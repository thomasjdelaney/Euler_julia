# In the 20×20 grid in files/twenty_twenty_grid.txt,
# What is the greatest product of four adjacent numbers in the same direction
# (up, down, left, right, or diagonally)?

function makeGrid(grid_file)
  grid = zeros(Int, 20, 20)
  lines = readlines(grid_file)
  for ll in 1:size(grid)[1]
    grid[ll,:] = map(x -> parse(Int,x), split(lines[ll]))
  end
  return grid
end

function horizontalGridMax(g, w)
  # g = array
  # w = Int, size of window over which to take the product
  # returns the maximum of the products of the groups of w numbers which are
  # horizontally adjacent.
  m,n = size(g)
  maxes = zeros(Int, n)
  for gg in 1:n
    maxes[n] = maximum(map(shift -> prod(circshift(g[gg, :], -shift)[1:w]), range(1, m-w)))
  end
  return maximum(maxes)
end

function diagGridMax(g, w)
  # g = array
  # w = Int, size of window over which to take the product
  # returns the maximum of the products of the groups of w numbers which are
  # horizontally adjacent.
  m,n = size(g)
  diags = map(x -> diag(g, x), range(w-m, (m-w)+1+(n-w)))
  maxes = zeros(Int, length(diags))
  for ii in 1:length(diags)
    d = diags[ii]
    if length(d) == w
      maxes[ii] = maximum(d)
    else
      r = range(0, length(d) - w)
      maxes[ii] = maximum(map(shift -> prod(circshift(d, -shift)[1:w]), r))
    end
  end
  return maximum(maxes)
end

function main()
  grid = makeGrid(homedir() * "/Euler/files/twenty_twenty_grid.txt")
  h_max = horizontalGridMax(grid, 4)
  v_max = horizontalGridMax(transpose(grid), 4)
  acute_max = diagGridMax(grid, 4)
  obtuse_max = diagGridMax(rotl90(grid), 4)
  return maximum([h_max, v_max, acute_max, obtuse_max])
end

println("Time: ", @elapsed answer = main())
println("Answer: $answer")
