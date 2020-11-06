#Yauheni Tsyrkunovich
x = [2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

properValue = -1.00657107000000*10^(-11)


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

	backSum = back_order_sum(x, y, T)
	backSumDiff = abs(properValue - backSum)
	inSum = in_order_sum(x, y, T)
	inSumDiff = abs(properValue - inSum)
	fromTop = top_to_bottom(x, y, T)
	fromTopDiff = abs(properValue - fromTop)
	fromBottom = bottom_to_top(x, y, T)
	fromBottomDiff = abs(properValue - fromBottom)

	println("In   order sum: $inSum")
	println("Difference: $inSumDiff")
	println("Back order sum: $backSum")
	println("Difference: $backSumDiff")
	println("From big values to small: $fromTop")
	println("Difference: $fromTopDiff")
	println("From small values to big: $fromBottom")
	println("Difference: $fromBottomDiff")
	println("")

end


