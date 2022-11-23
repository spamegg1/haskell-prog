-- Q8.2
-- Calculating Fibonacci numbers is perhaps the single most common example of a
-- recursive function. The most straightforward definition is as follows:
-- fib 0 = 0
-- fib 1 = 1
-- fib n = fib (n-1) + fib (n-2)
-- Like the Ackermann function, this implementation quickly explodes due to the
-- mutually recursive calls. But unlike the Ackermann function, there’s a
-- much more efficient way to compute the nth Fibonacci number.
-- Write a function, fastFib , that can compute the 1,000th Fibonacci number
-- nearly instantly.
-- Hint: fastFib takes three arguments: n1 , n2 , and counter .
-- To calculate the 1,000th Fibonacci number, you call
-- fastFib 1 1 1000 and for the 5th, you call fastFib 1 1 5 .

fastFib :: Int -> Int -> Int -> Int
fastFib _ _ 0 = 0
fastFib _ _ 1 = 1
fastFib _ _ 2 = 1
fastFib n1 n2 3 = n1 + n2
fastFib n1 n2 counter = fastFib (n1+n2) n1 (counter-1)

fib :: Int -> Int
fib n = fastFib 1 1 n
