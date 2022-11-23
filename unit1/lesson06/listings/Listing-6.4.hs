takeLast :: Int -> [a] -> [a]
takeLast n aList = reverse (take n (reverse aList))
