binlength = length(readline("day3in"))
data = map(i->(parse.(Int, collect(i))), readlines("day3in"))
counts = sum(data)

tobinary(l) = sum(enumerate(reverse(l))) do (i, v)
    v*2^(i-1)
end 

function scrubber(data, binlength, f)
    tobinary(only(foldl(1:binlength, init=data) do old, i
        if length(old) == 1
            return old
        end
        k =sum(old)[i] 
        aim = f(k, length(old) - k)
        maynew = filter(old) do k
            k[i] == aim
        end
        return length(maynew)==0 ? [old[end]] : maynew
    end))
end

so2 = scrubber(data, binlength, >=)
sco2 = scrubber(data, binlength, <)
so2*sco2