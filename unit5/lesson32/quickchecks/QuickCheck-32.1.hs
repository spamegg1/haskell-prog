-- Use do-notation to generate pairs of numbers up to 10 and their squares.

-- Answer:
numsAndSquares :: [(Int, Int)]
numsAndSquares = do
    value <- [1..10]
    return (value, value^2)
