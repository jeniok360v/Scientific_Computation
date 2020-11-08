#Yauheni Tsyrkunovich
using Polynomials



P=[1, -210.0-2^(-23), 20615.0,-1256850.0,
      53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,          
      11310276995381.0, -135585182899530.0,
      1307535010540395.0,     -10142299865511450.0,
      63030812099294896.0,     -311333643161390640.0,
      1206647803780373360.0,     -3599979517947607200.0,
      8037811822645051776.0,      -12870931245150988800.0,
      13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0]

roots_P = (roots(Polynomial((P))))
p = fromroots(1:20)

for i in 1:20
	zvalue = Polynomial((P))
	diff = abs(roots_P[i] - convert(Float64,i))
	println("z$i: $(roots_P[i]), |P(z$i)|: $(abs(zvalue(roots_P[i]))), ")
	println("|p(z$i)|: $(abs(p(roots_P[i]))), |z$i-$i|: $diff")
end


