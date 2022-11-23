type Bits = [Bool]

xorBool :: Bool -> Bool -> Bool
xorBool value1 value2 = (value1 || value2) && (not (value1 && value2))

xorPairs :: (Bool, Bool) -> Bool
xorPairs (v1, v2) = xorBool v1 v2

xor :: [Bool] -> [Bool] -> [Bool]
xor list1 list2 = map xorPairs (zip list1 list2)

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

bitsToChar :: Bits -> Char
bitsToChar = toEnum . bitsToInt


myPad :: String
myPad = "Shhhhhh"

myPlainText :: String
myPlainText = "Haskell"

applyOTP' :: String -> String -> [Bits]
applyOTP' pad plaintext = map xorPair zippedBits
    where
        xorPair = (\pair -> (fst pair) `xor` (snd pair))
        padBits = map charToBits pad
        plaintextBits = map charToBits plaintext
        zippedBits = zip padBits plaintextBits

applyOTP :: String -> String -> String
applyOTP pad plaintext = map bitsToChar bitList
    where bitList = applyOTP' pad plaintext

-- GHCi> applyOTP myPad myPlainText
-- "\ESC\t\ESC\ETX\r\EOT\EOT"
