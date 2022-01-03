data = parse.(Int, split(read("day7in", String), ","))

posrange = minimum(data):maximum(data)

f(n) = (n*(n+1)) ÷ 2

k = minimum(posrange) do pos
    sum(f.(abs.(data .- pos)))
end

print(k)
