data Color = Red | Yellow | Blue | Green | Purple | Orange | Brown
    deriving (Eq, Show)

instance Semigroup Color where
    (<>) a b | a == b = a
            | all (`elem` [Red, Blue, Purple]) [a, b] = Purple
            | all (`elem` [Blue, Yellow, Green]) [a, b] = Green
            | all (`elem` [Red, Yellow, Orange]) [a, b] = Orange
            | otherwise = Brown

-- GHCi> (Green <> Blue) <> Yellow
-- Green
-- GHCi> Green <> (Blue <> Yellow)
-- Green
