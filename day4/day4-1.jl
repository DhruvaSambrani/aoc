raw = read("day4in", String)
dt = split(raw, "\n\n")
callsraw = dt[1]
boardsraw = view(dt, 2:length(dt))
calls = parse.(Int, split(callsraw, ","))

function parseboard(boardraw)
    rowsraw = split(boardraw, "\n")
    rows = map(rowsraw) do rowraw
        parse.(Int, split(rowraw))
    end
    transpose(reduce(hcat, rows))
end

function checkwin(board)
    any(mapslices(i->all(==(-1), i), board, dims=1)) || any(mapslices(i->all(==(-1), i), board, dims=2)) 
end

function play!(boards, calls)
    for call in calls
        replace!.(boards, call => -1)
        ind = findfirst(checkwin, boards)
        if ind !== nothing
            return ind, call
        end
    end
    return nothing
end

boards = parseboard.(boardsraw)
ind, lastcall =  play!(boards, calls)

sum(i->i==-1 ? 0 : i, boards[ind])*lastcall
