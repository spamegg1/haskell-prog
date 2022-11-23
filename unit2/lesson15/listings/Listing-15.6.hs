data FourLetterAlphabet = L1 | L2 | L3 | L4 deriving (Show, Enum, Bounded)

rotN :: (Bounded a, Enum a) => Int -> a -> a
rotN alphabetSize char = toEnum rotation
    where
        halfAlphabet = alphabetSize `div` 2
        offset = fromEnum char + halfAlphabet
        rotation = offset `mod` alphabetSize

message :: [FourLetterAlphabet]
message = [L1, L3, L4, L1, L1, L2]

fourLetterAlphabetEncoder :: [FourLetterAlphabet] -> [FourLetterAlphabet]
fourLetterAlphabetEncoder = map (rotN alphabetSize)
    where alphabetSize = 1 + fromEnum (maxBound :: FourLetterAlphabet)

-- GHCi> fourLetterEncoder message
-- [L3,L1,L2,L3,L3,L4]
