data ThreeLetterAlphabet = Alpha | Beta | Kappa deriving (Show, Enum, Bounded)

rotN :: (Bounded a, Enum a) => Int -> a -> a
rotN alphabetSize char = toEnum rotation
    where
        halfAlphabet = alphabetSize `div` 2
        offset = fromEnum char + halfAlphabet
        rotation = offset `mod` alphabetSize

rotNdecoder :: (Bounded a, Enum a) => Int -> a -> a
rotNdecoder n c = toEnum rotation where
    halfN = n `div` 2
    offset = if even n
            then fromEnum c + halfN
            else 1 + fromEnum c + halfN
    rotation = offset `mod` n

threeLetterMessage :: [ThreeLetterAlphabet]
threeLetterMessage = [Alpha, Alpha, Beta, Alpha, Kappa]

alphabetSize :: Int
alphabetSize = 1 + fromEnum (maxBound :: ThreeLetterAlphabet)

threeLetterEncoder :: [ThreeLetterAlphabet] -> [ThreeLetterAlphabet]
threeLetterEncoder = map (rotN alphabetSize)

threeLetterDecoder :: [ThreeLetterAlphabet] -> [ThreeLetterAlphabet]
threeLetterDecoder = map (rotNdecoder alphabetSize)

-- GHCi> threeLetterEncoder threeLetterMessage
-- [Beta,Beta,Kappa,Beta,Alpha]
-- GHCi> threeLetterDecoder (threeLetterEncoder threeLetterMessage)
-- [Alpha,Alpha,Beta,Alpha,Kappa]
