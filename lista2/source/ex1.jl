#Yauheni Tsyrkunovich
x1 = [2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
y1 = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

x2 = [2.718281828, -3.141592654, 1.414213562, 0.577215664 , 0.301029995 ]
y2 = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

properValue =  -1.00657107000000*10^(-11)
properValue2 = -0.004296343192495245
			#  -0.004296342739891585


function in_order_sum(x, y, T)
    s::T = 0.0
    for i in 1:length(x)
        s += x[i]*y[i]
    end
    return s
end

function back_order_sum(x, y, T)
	return in_order_sum(reverse(x), reverse(y), T)
end

function top_to_bottom(x, y, T)
	posSubSum = zeros(T, 0)
	negSubSum = zeros(T, 0)
	for i in 1:length(x)
		subSum::T = x[i]*y[i]
		if subSum >= 0.0
			append!(posSubSum, subSum)
		else
			append!(negSubSum, subSum)
		end
	end
	return sum(sort(negSubSum))+sum(reverse(sort(posSubSum)))
end	

function bottom_to_top(x, y, T)
	posSubSum = zeros(T, 0)
	negSubSum = zeros(T, 0)
	for i in 1:length(x)
		subSum::T = x[i]*y[i]
		if subSum >= 0.0
			append!(posSubSum, subSum)
		else
			append!(negSubSum, subSum)
		end
	end
	return sum(reverse(sort(negSubSum)))+sum(sort(posSubSum))
end	

for T in [Float16, Float32, Float64]
		println("$(lpad(T, 7))")

		backSum = back_order_sum(x1, y1, T)
		backSumDiff = abs(properValue - backSum)
		inSum = in_order_sum(x1, y1, T)
		inSumDiff = abs(properValue - inSum)
		fromTop = top_to_bottom(x1, y1, T)
		fromTopDiff = abs(properValue - fromTop)
		fromBottom = bottom_to_top(x1, y1, T)
		fromBottomDiff = abs(properValue - fromBottom)

		backSum2 = back_order_sum(x2, y2, T)
		backSumDiff2 = abs(properValue2 - backSum2)
		inSum2 = in_order_sum(x2, y2, T)
		inSumDiff2 = abs(properValue2 - inSum2)
		fromTop2 = top_to_bottom(x2, y2, T)
		fromTopDiff2 = abs(properValue2 - fromTop2)
		fromBottom2 = bottom_to_top(x2, y2, T)
		fromBottomDiff2 = abs(properValue2 - fromBottom2)

		println("properValue:  $properValue")
		println("properValue2: $properValue2\n")

		println("~~~(x1, y1)~~~")
		println("In   order sum: $inSum")
		println("Difference: $inSumDiff")
		println("Back order sum: $backSum")
		println("Difference: $backSumDiff")
		println("From big values to small: $fromTop")
		println("Difference: $fromTopDiff")
		println("From small values to big: $fromBottom")
		println("Difference: $fromBottomDiff")
		println("")

		println("~~~(x2, y2)~~~")
		println("In   order sum: $inSum2")
		println("Difference: $inSumDiff2")
		println("Back order sum: $backSum2")
		println("Difference: $backSumDiff2")
		println("From big values to small: $fromTop2")
		println("Difference: $fromTopDiff2")
		println("From small values to big: $fromBottom2")
		println("Difference: $fromBottomDiff2")
		println("")



end


