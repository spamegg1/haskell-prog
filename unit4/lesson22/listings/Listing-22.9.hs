import Data.List.Split                                     -- needed for splitOn

-- splitOn :: Eq a => [a] -> [a] -> [[a]]
myLines :: String -> [String]                              -- [Char] -> [[Char]]
myLines = splitOn "\n"
