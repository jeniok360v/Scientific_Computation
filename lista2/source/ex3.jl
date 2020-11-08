#Yauheni Tsyrkunovich
using LinearAlgebra

function matcond(n::Int, c::Float64)
# Function generates a random square matrix A of size n with
# a given condition number c.
# Inputs:
#	n: size of matrix A, n>1
#	c: condition of matrix A, c>= 1.0
#
# Usage: matcond(10, 100.0)
#
# Pawel Zielinski
        if n < 2
         error("size n should be > 1")
        end
        if c< 1.0
         error("condition number  c of a matrix  should be >= 1.0")
        end
        (U,S,V)=svd(rand(n,n))
        return U*diagm(0 =>[LinRange(1.0,c,n);])*V'
end





function hilb(n::Int)
# Function generates the Hilbert matrix  A of size n,
#  A (i, j) = 1 / (i + j - 1)
# Inputs:
#	n: size of matrix A, n>=1
#
#
# Usage: hilb(10)
#
# Pawel Zielinski
        if n < 1
         error("size n should be >= 1")
        end
        return [1 / (i + j - 1) for i in 1:n, j in 1:n]
end

println("~~~Macierz Hilbera~~~")
for n in [5, 10, 20]
	A = hilb(n)
	x = fill(1.0, (n,1))
	b = A*x
	xNew1 = inv(A)*b 	#szukany wektor x obliczony za pomoca macierzy odwrotnej
	xNew2 = A\b 		#ten samy wektor obliczony na inny sposob

	println("\nn=$n")
	#println(A)
	#println(x)
	println("b: $b")

	println("xNew1: $xNew1")
	println("Roznica: $(xNew1 - x)")
	println("xNew2: $xNew2")
	println("Roznica: $(xNew2 - x)")
end

println("\n~~~Macierz losowa~~~")
for n in [5, 10, 20]
	for c in [1.0, 10.0, 10.0^3, 10.0^7, 10.0^12, 10.0^16]
		A = matcond(n, c)
		x = fill(1.0, (n,1))
		b = A*x
		xNew1 = inv(A)*b 	#szukany wektor x obliczony za pomoca macierzy odwrotnej
		xNew2 = A\b 		#ten samy wektor obliczony na inny sposob

		println("\nn=$n")
		println("c=$c")
		#println(A)
		#println(x)
		println("b: $b")

		println("xNew1: $xNew1")
		println("Roznica: $(xNew1 - x)")
		println("xNew2: $xNew2")
		println("Roznica: $(xNew2 - x)")
	end
end


