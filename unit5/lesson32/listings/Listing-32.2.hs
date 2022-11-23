powersOfTwo :: Int -> [Int]
powersOfTwo n = do
    value <- [1..n]
    return (2^value)

powersOfTwoAndThree :: Int -> [(Int, Int)]
powersOfTwoAndThree n = do
    value <- [1..n]
    return (2^value, 3^value)

allEvenOdds :: Int -> [(Int, Int)]
allEvenOdds n = do
    evenValue <- [2,4..n]
    oddValue <- [1,3..n]
    return (evenValue, oddValue)
