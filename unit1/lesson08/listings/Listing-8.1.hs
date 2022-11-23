myLength :: [a] -> Int
myLength [] = 0
myLength xs = 1 + myLength (tail xs)
