-- map :: (a -> b) -> [a] -> [b]
-- read :: Read a => String -> a
-- lines :: String -> [String]

-- map read :: Read b => [String] -> [b]
-- map read . lines :: Read b => String -> [b]
-- map read . lines :: Read Int => String -> [Int]
toInts :: String -> [Int]
toInts = (map read) . lines
