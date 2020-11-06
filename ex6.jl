#Yauheni Tsyrkunovich
function f(x::Float64)
    return (x^2+1.0)^0.5-1.0
end

function g(x::Float64)
    return x^2/((x^2+1.0)^0.5+1.0)
end

function functionsDiff()
    x::Float64 = 1/8
    for i in 1:16
        println("f(x): $(lpad(f(x), 22)) g(x): $(lpad(g(x), 22)) x: 8^-$i ")
        x /= 8
    end
end

functionsDiff()