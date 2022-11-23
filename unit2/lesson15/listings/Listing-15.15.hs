type Bits = [Bool]

intToBits' :: Int -> Bits
intToBits' 0 = [False]
intToBits' 1 = [True]
intToBits' n = (n `mod` 2 /= 0) : intToBits (n `div` 2)
