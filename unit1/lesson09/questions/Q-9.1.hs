-- Q9.1
-- Use filter and length to re-create the elem function.

myElem :: Eq a => a -> [a] -> Bool
myElem x xs = 0 < length (filter (== x) xs)
