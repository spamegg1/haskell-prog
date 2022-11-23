import Control.Monad                   -- guard :: Alternative f => Bool -> f ()

evensGuard :: Int -> [Int]
evensGuard n = do
    value <- [1..n]
    guard $ even value
    return value

evenSquares :: [Int]
evenSquares = do
    n <- [0 .. 9]
    let nSquared = n^2
    guard(even nSquared)
    return nSquared

powersOfTwo :: Int -> [Int]
powersOfTwo n = [2^value | value <- [1..n]]

powersOfTwoAndThree :: Int -> [(Int, Int)]
powersOfTwoAndThree n = [(2^value, 3^value) | value <- [1..n]]

allEvenOdds :: Int -> [(Int, Int)]
allEvenOdds n = [(evenVal, oddVal) | evenVal <- [2,4..n], oddVal <- [1,3..n]]

evensGuard2 :: Int -> [Int]
evensGuard2 n = [value | value <- [1..n], even value]
