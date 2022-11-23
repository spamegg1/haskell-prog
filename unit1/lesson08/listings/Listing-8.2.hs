myTake :: Int -> [a] -> [a]
myTake _ [] = []
myTake 0 _ = []
myTake n (x : xs) = x : rest
    where rest = myTake (n - 1) xs
