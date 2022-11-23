-- Q3.2
-- Using a let expression and a lambda function aren’t
-- exactly the same thing under the hood. For example,
-- the following code will cause an error if you try to run it:

-- counter x = let x = x + 1 in
--                 let x = x + 1 in
--                     x

-- (it does not "cause an error", it gets stuck in an infinite loop and hangs.)

-- To prove that let and lambda aren’t identical,
-- rewrite the counter function exactly as it is
-- here, but use nested lambdas instead of let .
-- (Hint: Start at the end.)

counter :: Int -> Int
counter x = (\x -> x + 1) ((\x -> x + 1) x)
