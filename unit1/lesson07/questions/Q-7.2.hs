-- Q7.2
-- Rewrite myGCD by using pattern matching.
myGCD :: Int -> Int -> Int
myGCD a 0 = a
myGCD a b = myGCD b (mod a b)
