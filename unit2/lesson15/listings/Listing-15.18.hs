type Bits = [Bool]

intToBits' :: Int -> Bits
intToBits' 0 = [False]
intToBits' 1 = [True]
intToBits' n = (n `mod` 2 /= 0) : intToBits' (n `div` 2)

maxBits :: Int
maxBits = length (intToBits' maxBound)

intToBits :: Int -> Bits
intToBits n = leadingFalses ++ reversedBits
    where
        reversedBits = reverse (intToBits' n)
        missingBits = maxBits - (length reversedBits)
        leadingFalses = take missingBits (cycle [False])

charToBits :: Char -> Bits
charToBits char = intToBits (fromEnum char)

bitsToInt :: Bits -> Int
bitsToInt bits = sum $ map (\x -> 2^(snd x)) trueLocations
    where
        size = length bits
        indices = [size - 1, size - 2 .. 0]
        trueLocations = filter (\x -> fst x) (zip bits indices)

-- GHCi> bitsToInt (intToBits 32)
-- 32
-- GHCi> bitsToInt (intToBits maxBound)
-- 9223372036854775807
