println("nextfloat(convert(T,1.0))-(convert(T,1.0)), gdzie T - typ")
for T in [Float16, Float32, Float64]
	myeps=nextfloat(convert(T,1.0))-(convert(T,1.0))
	diff = myeps-eps(T)
	println("$(lpad(T, 7)): $myeps")
end

println("Wbudowana funkcja eps(T)")
for T in [Float16, Float32, Float64]
	println("$(lpad(T, 7)): $(eps(T))")
end

println("Roznica:")
for T in [Float16, Float32, Float64]
	myeps=nextfloat(convert(T,1.0))-(convert(T,1.0))
	diff = myeps-eps(T)
	println("$(lpad(T, 7)): $(diff)")
end

