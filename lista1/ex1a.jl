#Yauheni Tsyrkunovich
function myeps(T)
	epsMasz=convert(T,1.0)
	while T(1.0) + (epsMasz/2) > T(1.0)
		epsMasz /= T(2.0)
	end
	return epsMasz
end

for T in [Float16, Float32, Float64]
	println("$(lpad(T, 7))")
	
	epsPoliczone = myeps(T)
	diff = epsPoliczone-eps(T)
	println("Policzone epsilon: $epsPoliczone")
	println("Wbudowane epsilon: $(eps(T))")
	println("Roznica: $diff")
end
