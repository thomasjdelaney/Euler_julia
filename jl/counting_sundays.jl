# How many Sundays fell on the first of the month during the
# twentieth century (1 Jan 1901 to 31 Dec 2000)?

function main()
  number_of_sundays = 0
  for y in 1901:2000
    for m in 1:12
      if Dates.dayname(Date(y, m, 1)) == "Sunday"
        number_of_sundays = number_of_sundays + 1
      end
    end
  end
  return number_of_sundays
end

println("Time: ", @elapsed answer = main())
println("Answer: $answer")
