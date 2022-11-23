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



class Cipher a where
    encode :: a -> String -> String
    decode :: a -> String -> String

data Rot = Rot

instance Cipher Rot where
    encode Rot text = rotEncoder text
    decode Rot text = rotDecoder text

-- GHCi> encode Rot "Haskell"
-- "\557128\557153\557171\557163\557157\557164\557164"
-- GHCi> decode Rot "\557128\557153\557171\557163\557157\557164\557164"
-- "Haskell"
