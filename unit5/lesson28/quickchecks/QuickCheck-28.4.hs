-- Use minOfThree to get the Maybe Int value of these three Maybe values:
val1 = Just 10
val2 = Just 3
val3 = Just 6

-- Answer:
minOfThree :: Ord a => a -> a -> a -> a
minOfThree x y z = min x (min y z)

minOfInts :: Maybe Int
minOfInts = minOfThree <$> val1 <*> val2 <*> val3
