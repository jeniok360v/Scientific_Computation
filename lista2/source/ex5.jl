#Yauheni Tsyrkunovich
function log_pop!(T, p0, steps)
    r = T(3)
    
    for n in 1:steps
        pNext = p0 + T(r * p0 * (1 - p0))
        
        #println("$n $pNext")
        p0 = pNext
    end
    return p0
end


for T in [Float32, Float64]
    println(log_pop!(T, 0.01, 40))

    temp = log_pop!(T, 0.01, 10)
    temp = (floor(temp*1000))/1000
    println(log_pop!(T, temp, 30))
end



