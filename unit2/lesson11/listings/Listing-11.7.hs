ifEven :: (Int -> Int) -> Int -> Int
ifEven f n = if even n then f n else n
