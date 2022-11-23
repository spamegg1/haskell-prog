rotNdecoder :: (Bounded a, Enum a) => Int -> a -> a
rotNdecoder n c = toEnum rotation where
    halfN = n `div` 2
    offset = if even n
            then fromEnum c + halfN
            else 1 + fromEnum c + halfN
    rotation = offset `mod` n
