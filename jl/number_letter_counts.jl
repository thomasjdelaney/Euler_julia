# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

nl_dict = Dict{Int64, String}()
nl_dict[1] = "one"
nl_dict[2] = "two"
nl_dict[3] = "three"
nl_dict[4] = "four"
nl_dict[5] = "five"
nl_dict[6] = "six"
nl_dict[7] = "seven"
nl_dict[8] = "eight"
nl_dict[9] = "nine"
nl_dict[10] = "ten"
nl_dict[11] = "eleven"
nl_dict[12] = "twelve"
nl_dict[13] = "thirteen"
nl_dict[14] = "fourteen"
nl_dict[15] = "fifteen"
nl_dict[16] = "sixteen"
nl_dict[17] = "seventeen"
nl_dict[18] = "eighteen"
nl_dict[19] = "nineteen"
nl_dict[20] = "twenty"
nl_dict[30] = "thirty"
nl_dict[40] = "forty"
nl_dict[50] = "fifty"
nl_dict[60] = "sixty"
nl_dict[70] = "seventy"
nl_dict[80] = "eighty"
nl_dict[90] = "ninety"
nl_dict[100] = "one hundred"
nl_dict[1000] = "one thousand"

function translate(n)
  # translate int n into words
  if n in keys(nl_dict)
    return nl_dict[n]
  elseif 0 == mod(n, 100)
    return nl_dict[convert(Int64, n/100)]*" hundred"
  elseif 0 == mod(n, 10)
    h, t = divrem(n, 100)
    return nl_dict[h]*" hundred and "*nl_dict[t]
  elseif n > 100
    h, to = divrem(n, 100)
    return nl_dict[h]*" hundred and "*translate(to)
  elseif n < 100
    t, o = divrem(n, 10)
    return nl_dict[t*10]*" "*nl_dict[o]
  else
    return error("unrecognised number!")
  end
end

function main()
  long_string = ""
  for n in 1:1000
    long_string = long_string*translate(n)
  end
  no_space = replace(long_string, " ", "")
  return length(no_space)
end

println("Time: ", @elapsed answer = main())
println("Answer: $answer")
