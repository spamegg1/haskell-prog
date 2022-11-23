-- Use pattern matching to rewrite myLength without
-- needing to explicitly call tail.

myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs
