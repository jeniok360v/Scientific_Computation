#Yauheni Tsyrkunovich
function mymax(T)
	maxReturn=T(2.0-eps(T))
	while !isinf(maxReturn*T(2.0))
		maxReturn *= T(2.0)
	end
	return maxReturn
end

for T in [Float16, Float32, Float64]
	println("$(lpad(T, 7))")
	
	maxPolicznone = mymax(T)
	diff = maxPolicznone-floatmax(T)
	println("Policzone MAX: $maxPolicznone")
	println("Wbudowane MAX: $(floatmax(T))")
	println("Roznica: $diff")
end
