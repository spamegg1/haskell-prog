ones :: Int -> [Int]
ones n = take n (cycle [1])

-- GHCi> ones 2
-- [1,1]
-- GHCi> ones 4
-- [1,1,1,1]
