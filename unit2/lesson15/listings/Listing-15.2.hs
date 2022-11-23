data FourLetterAlphabet = L1 | L2 | L3 | L4 deriving (Show, Enum, Bounded)

rotN :: (Bounded a, Enum a) => Int -> a -> a
rotN alphabetSize char = toEnum rotation
    where
        halfAlphabet = alphabetSize `div` 2
        offset = fromEnum char + halfAlphabet
        rotation = offset `mod` alphabetSize

-- GHCi> rotN 4 L1
-- L3
-- GHCi> rotN 4 L2
-- L4
-- GHCi> rotN 4 L3
-- L1
-- GHCi> rotN 4 L4
-- L2
