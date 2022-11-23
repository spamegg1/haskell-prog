minOfThree :: Ord a => a -> a -> a -> a
minOfThree x y z = min x (min y z)

readInt :: IO Int
readInt = read <$> getLine

minOfInts :: IO Int
minOfInts = minOfThree <$> readInt <*> readInt <*> readInt

main :: IO ()
main = do
    putStrLn "Enter three numbers"
    minInt <- minOfInts
    putStrLn $ show minInt ++ " is the smallest"

-- *Main> main
-- Enter three numbers
-- 5
-- 2
-- 9
-- 2 is the smallest
