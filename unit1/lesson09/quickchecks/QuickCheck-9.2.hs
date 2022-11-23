-- Write the function myProduct, which calculates the product of a list of
-- numbers.

myProduct :: [Int] -> Int
myProduct xs = foldl (*) 1 xs
