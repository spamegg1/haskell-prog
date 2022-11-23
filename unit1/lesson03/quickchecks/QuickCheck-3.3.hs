-- Redefine overwrite by using only lambdas.
overwrite :: Int -> Int
overwrite x = (\x -> (\x -> (\x -> x) 4 ) 3 ) 2
