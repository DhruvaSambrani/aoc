data = readlines("day3in")
binlength = length(data[1])
counts = sum(digits.(parse.(Int, data, base=2), base=2, pad=binlength))
ts = map(>(length(data)÷2), counts)

tobinary(l) = sum(enumerate(l)) do (i, v)
    v*2^(i-1)
end 
γ = tobinary(ts)
ϵ = tobinary(map(!, ts))
ϵ*γ
