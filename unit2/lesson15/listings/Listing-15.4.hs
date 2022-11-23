rotN :: (Bounded a, Enum a) => Int -> a -> a
rotN alphabetSize char = toEnum rotation
    where
        halfAlphabet = alphabetSize `div` 2
        offset = fromEnum char + halfAlphabet
        rotation = offset `mod` alphabetSize

rotChar :: Char -> Char
rotChar charToEncrypt = rotN alphabetSize charToEncrypt
    where alphabetSize = 1 + fromEnum (maxBound :: Char)
