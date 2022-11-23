-- Q2.3
-- Write a function that takes a value n .
-- If n is even, the function returns n - 2 , and
-- if the number is odd, the function returns 3 × n + 1 .
-- To check whether the number is even, you can use either
-- Haskell’s even function or mod (Haskell’s modulo function).
collatz :: Int -> Int
collatz n =
    if even n
    then n - 2
    else 3 * n + 1
