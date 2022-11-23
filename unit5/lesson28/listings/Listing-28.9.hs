minOfThree :: Ord a => a -> a -> a -> a
minOfThree x y z = min x (min y z)

readInt :: IO Int
readInt = read <$> getLine

minOfInts :: IO Int
minOfInts = minOfThree <$> readInt <*> readInt <*> readInt

-- *Main> minOfInts
-- 3
-- 7
-- 4
-- 3
