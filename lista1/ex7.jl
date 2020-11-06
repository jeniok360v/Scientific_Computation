#Yauheni Tsyrkunovich
function calc_der_approximated(f, x::Float64, h::Float64)
    return (f(x+h)-f(x))/h
end

function derCalc(x::Float64)
    return cos(x)-3*sin(3*x)
end

function f(x::Float64)
    return sin(x) + cos(3*x)
end

function derDiff()
    h::Float64 = 1.0
    for i in 0:54
        println("h: 2^-$i der: $(calc_der_approximated(f, 1.0, h)) err: $(abs(derCalc(1.0)-calc_der_approximated(f, 1.0, h)))")
        h /= 2.0
    end
end

derDiff()