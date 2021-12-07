data = split.(readlines("day2in"))
dict = Dict("forward"=>1, "up"=>1im, "down"=>-1im)
k = sum(data, init=0) do i
    dict[i[1]] * parse(Int, i[2])
end
print(- real(k) * imag(k))
