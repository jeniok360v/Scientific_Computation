#Yauheni Tsyrkunovich
function find_not_equal(in)
    x::Float64 = in
    
    while x*(1/x) == 1.0 && x < 2.0
        x = nextfloat(x)
    end
    return x
end

println(find_not_equal(1.0))