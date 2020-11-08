#Yauheni Tsyrkunovich
function sqrtLike(c, x0)
	arr = []
	push!(arr, x0)
	for i in 1:40
		xNew = Float64(x0)^2 + Float64(c)
		push!(arr, xNew)
		x0 = xNew
	end
	return arr
end

v1 = sqrtLike(-2, 1)
v2 = sqrtLike(-2, 2)
v3 = sqrtLike(-2, 1.99999999999999)
v4 = sqrtLike(-1, 1)
v5 = sqrtLike(-1, -1)
v6 = sqrtLike(-1, 0.75)
v7 = sqrtLike(-1, 0.25)

for i in 1:41
	println("$i, $(v1[i]), $(v2[i]), $(v3[i]), $(v4[i]), $(v5[i]), $(v6[i]), $(v7[i])")
end