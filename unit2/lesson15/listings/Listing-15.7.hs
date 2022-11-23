data ThreeLetterAlphabet = Alpha | Beta | Kappa deriving (Show, Enum, Bounded)

rotN :: (Bounded a, Enum a) => Int -> a -> a
rotN alphabetSize char = toEnum rotation
    where
        halfAlphabet = alphabetSize `div` 2
        offset = fromEnum char + halfAlphabet
        rotation = offset `mod` alphabetSize

threeLetterMessage :: [ThreeLetterAlphabet]
threeLetterMessage = [Alpha, Alpha, Beta, Alpha, Kappa]

threeLetterEncoder :: [ThreeLetterAlphabet] -> [ThreeLetterAlphabet]
threeLetterEncoder = map (rotN alphabetSize)
    where alphabetSize = 1 + fromEnum (maxBound :: ThreeLetterAlphabet)

-- GHCi> threeLetterEncoder (threeLetterEncoder threeLetterMessage)
-- [Kappa,Kappa,Alpha,Kappa,Beta]
