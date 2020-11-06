#Yauheni Tsyrkunovich
function myeta(T)
	etaMasz=convert(T,1.0)
	while (etaMasz/2) > T(0.0)
		etaMasz /= T(2.0)
	end
	return etaMasz
end

for T in [Float16, Float32, Float64]
	println("$(lpad(T, 7))")
	
	etaPolicznone = myeta(T)
	diff = etaPolicznone-nextfloat(T(0.0))
	println("Policzone eta: $etaPolicznone")
	println("Wbudowane eta: $(nextfloat(T(0.0)))")
	println("Roznica: $diff")
end
