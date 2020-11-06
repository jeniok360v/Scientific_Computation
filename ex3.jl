#Yauheni Tsyrkunovich
function segment_delta(left, amount, step)
    i::Float64 = 1.0
    
    while i < amount
        println(bitstring(Float64(left)+i*Float64(step)))
        i += 1.0
    end
end

segment_delta(1.0,10, 2^(-52))
