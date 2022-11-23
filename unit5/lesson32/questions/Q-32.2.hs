-- Translate the preceding question into do-notation, and then into Monad
-- methods and lambdas.

-- Answer:
monthLengths :: [Int]
monthLengths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

dates :: [Int] -> [Int]
dates lengths = do
    l <- lengths
    date <- [1..l]
    return date

dates2 :: [Int] -> [Int]
-- (>>=) :: Monad m => m a -> (a -> m b) -> m b
-- m = List, b = Int, so a = Int
dates2 lengths = lengths >>= (\int -> [1..int])
