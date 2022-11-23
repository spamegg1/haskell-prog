import qualified Data.ByteString.Char8 as BC

intToChar :: Int -> Char
intToChar int = toEnum $ int `mod` 255

intToBC :: Int -> BC.ByteString
intToBC int = BC.pack [intToChar int]
