toInts :: String -> [Int]
toInts = map read . lines

main :: IO ()
main = do
    userInput <- getContents                              -- [Char] <- IO [Char]
    print $ sum $ toInts userInput

-- ghc Listing-22.11.hs -o sum_lazy
-- ./sum_lazy
-- 1
-- 2
-- 3
-- 4
-- <ctrl+D>
-- 10
