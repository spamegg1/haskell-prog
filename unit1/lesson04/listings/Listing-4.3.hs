ifEven :: (Int -> Int) -> Int -> Int
ifEven myFunction x = if even x then myFunction x else x

inc n = n + 1
double n = n * 2
square n = n ^ 2

ifEvenInc :: Int -> Int
ifEvenInc n = ifEven inc n

ifEvenDouble :: Int -> Int
ifEvenDouble n = ifEven double n

ifEvenSquare :: Int -> Int
ifEvenSquare n = ifEven square n
