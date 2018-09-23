# Which starting number, under one million, produces the longest chain?

function iterCollatz(n)
  return 0 == mod(n, 2) ? convert(Int64, n/2) : 3n + 1
end

function createCollatzSeries(start, node_dict)
  # create the full Collatz series starting from start
  # args: start = Int, the starting point
  # returns: array = the full series
  # println("starting Collatz series for $start...")
  collatz_series = [start]
  next = start
  while (next != 1) && (!in(next, keys(node_dict)))
    next = iterCollatz(next)
    append!(collatz_series, next)
  end
  return collatz_series
end

function main()
  series = createCollatzSeries(999999, Dict())
  node_dict = Dict(series[ii] => length(series) - ii for ii in 1:length(series))
  for n in range(999997, -2, div(999997,2))
    if !in(n, keys(node_dict))
      series = createCollatzSeries(n, node_dict)
      [node_dict[series[ii]] = node_dict[series[end]] + length(series) - ii for ii in 1:length(series)]
    end
  end
  return collect(keys(node_dict))[indmax(values(node_dict))]
end

println("Time: ", @elapsed answer = main())
println("Answer: $answer")
