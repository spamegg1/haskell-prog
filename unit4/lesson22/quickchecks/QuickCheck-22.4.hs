-- Write a program that returns the sum of the squares of the input.

-- Answer:
toInts :: String -> [Int]
toInts = map read . lines

main :: IO ()
main = do
    userInput <- getContents
    print $ sum $ map (^2) $ toInts userInput

-- ghc QuickCheck-22.4.hs -o sum_sq
-- ./sum_sq
-- 1
-- 2
-- 3
-- 4
-- <ctrl+D>
-- 30
