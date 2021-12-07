function parseline(line)
    points = split.(split(line, " -> "), ",")
    (x1,y1), (x2,y2) = sort(map(points) do point
        parse.(Int, point) .+ [1, 1]
    end)
    if x1==x2 || y1==y2
        CartesianIndex(x1, y1):CartesianIndex(x2, y2)
    elseif abs(y2-y1) == abs(x2-x1)
        map(range(x1, x2, length=abs(x1-x2)+1), range(y1, y2, length=abs(y1-y2)+1)) do x,y
            CartesianIndex(Int(x),Int(y))
        end
    else
        nothing
    end
end

lines = filter(!isnothing, parseline.(readlines("day5in")))

boardsize = Tuple(maximum(maximum.(lines)))
board = zeros(Int, boardsize)
for line in lines
    board[line] .+= 1
end
board'
count(>=(2), board)