-- Haskell has a function named div that does perform integer division
-- (it returns only whole numbers). Write halve, which uses div instead,
-- and include a type signature.
halve :: Int -> Int
halve n = div n 2
