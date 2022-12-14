-- Q6.2
-- Write a function subseq that takes three arguments:
-- a start position, an end position, and a list.
-- The function should return the subsequence between the start and end.
-- For example:
-- GHCi> subseq 2 5 [1 .. 10]
-- [3,4,5]
-- GHCi> subseq 2 7 "a puppy"
-- "puppy"

subseq :: Int -> Int -> [a] -> [a]
subseq start end list = take (end - start) (drop start list)
