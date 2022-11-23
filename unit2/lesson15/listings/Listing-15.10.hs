-- Alphabets
data ThreeLetterAlphabet = Alpha | Beta | Kappa deriving (Show, Enum, Bounded)
data FourLetterAlphabet = L1 | L2 | L3 | L4 deriving (Show, Enum, Bounded)


-- General encoder/decoder
rotN :: (Bounded a, Enum a) => Int -> a -> a
rotN alphabetSize char = toEnum rotation where
    halfAlphabet = alphabetSize `div` 2
    offset = fromEnum char + halfAlphabet
    rotation = offset `mod` alphabetSize

rotNdecoder :: (Bounded a, Enum a) => Int -> a -> a
rotNdecoder n c = toEnum rotation where
    halfN = n `div` 2
    offset = fromEnum c + halfN + (if even n then 0 else 1)
    rotation = offset `mod` n


-- Normal 26 character alphabet, encoder, decoder
alphaSize = 1 + fromEnum (maxBound :: Char)

rotEncoder :: String -> String
rotEncoder = map (rotN alphaSize)

rotDecoder :: String -> String
rotDecoder = map (rotNdecoder alphaSize)


-- Three letter alphabet, encoder, decoder
threeAlphaSize = 1 + fromEnum (maxBound :: ThreeLetterAlphabet)

threeLetterEncoder :: [ThreeLetterAlphabet] -> [ThreeLetterAlphabet]
threeLetterEncoder = map (rotN threeAlphaSize)

threeLetterDecoder :: [ThreeLetterAlphabet] -> [ThreeLetterAlphabet]
threeLetterDecoder = map (rotNdecoder threeAlphaSize)


-- Four letter alphabet, encoder, decoder
fourAlphaSize = 1 + fromEnum (maxBound :: FourLetterAlphabet)

fourLetterEncoder :: [FourLetterAlphabet] -> [FourLetterAlphabet]
fourLetterEncoder = map (rotN fourAlphaSize)

fourLetterDecoder :: [FourLetterAlphabet] -> [FourLetterAlphabet]
fourLetterDecoder = map (rotNdecoder fourAlphaSize)

-- GHCi> rotEncoder "hi"
-- "\557160\557161"
-- GHCi> rotDecoder(rotEncoder "hi")
-- "hi"
-- GHCi> rotEncoder "Jean-Paul likes Simone"
-- "\557130\557157\557153\55....
-- GHCi> rotDecoder (rotEncoder "Jean-Paul likes Simone")
-- "Jean-Paul likes Simone"
