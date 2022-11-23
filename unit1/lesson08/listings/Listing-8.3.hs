myCycle :: [a] -> [a]
myCycle (first : rest) = first : myCycle(rest++[first])
