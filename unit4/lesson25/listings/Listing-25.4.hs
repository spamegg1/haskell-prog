intToChar :: Int -> Char
intToChar int = toEnum $ int `mod` 255
