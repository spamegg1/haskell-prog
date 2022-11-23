import qualified Data.ByteString.Char8 as BC

intToChar :: Int -> Char
intToChar int = toEnum $ int `mod` 255

intToBC :: Int -> BC.ByteString
intToBC int = BC.pack [intToChar int]

replaceByte :: Int -> Int -> BC.ByteString -> BC.ByteString
replaceByte loc charVal bytes = mconcat [before, newChar, after] where
    (before, rest) = BC.splitAt loc bytes
    after = BC.drop 1 rest
    newChar = intToBC charVal
