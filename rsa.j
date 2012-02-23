#!/usr/bin/env julia

# Fermat's little theorem performed 50 times to leave 1/2^50 chance of non-prime
# (well, unless it's a dastardly carmichael number)
function probably_prime(p)
    for i = 0:50 
        if powermod(randi(p - 1), (p - 1), p) != 1 
          return false
        end  
    end  
    return true 
end

function is_coprime(a, b)
    if b == 0
        return a == 1
    end
    return is_coprime(b, a % b)
end
                                                                                                                 
println(probably_prime(571))
