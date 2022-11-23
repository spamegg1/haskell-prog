-- Write a function genIfXEven that creates a closure with x
-- and returns a new function that allows the user to pass
-- in a function to apply to x if x is even.

genIfXEven :: Int -> (Int -> Int) -> Int
genIfXEven x = (\f -> if even x then f x else x)
