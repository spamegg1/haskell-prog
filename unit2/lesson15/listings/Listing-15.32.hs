prng :: Int -> Int -> Int -> Int -> Int
prng a b maxNumber seed = (a*seed + b) `mod` maxNumber

examplePRNG :: Int -> Int
examplePRNG = prng 1337 7 100

-- GHCi> examplePRNG 12345
-- 72
-- GHCi> examplePRNG 72
-- 71
-- GHCi> examplePRNG 71
-- 34
-- GHCi> examplePRNG 34
-- 65
