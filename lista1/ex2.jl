#Yauheni Tsyrkunovich
for T in [Float16, Float32, Float64]
	println("$(lpad(T, 7))")

	tmp=T(T(3.0)*(T(4/3)-1.0)-1.0)
	diff = abs(tmp)-eps(T)
	println("Policzone wyrazine: $tmp")
	println("Wbudowane epsilon:  $(eps(T))")
	println("Roznica abs(wyrazenie)-epsilon: $diff")
end
