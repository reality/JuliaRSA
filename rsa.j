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

function get_next_prime(p)
    if p < 4 
        return p
    end
    
    if probably_prime(p)
        return p
    else
        return get_next_prime(p + 2)
    end
end

function generate_prime(bitlength)
    p = 1
    for x = 0:bitlength
        p = p * 2 + randi((0, 1))
    end

    #p = (p << 1) + 1
    if p % 2 == 0
        p += 1
    end

    return get_next_prime(p)
end

println(generate_prime(8))
