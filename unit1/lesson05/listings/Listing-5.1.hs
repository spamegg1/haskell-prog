ifEven :: (Int -> Int) -> Int -> Int
ifEven myFunction n = if even n then myFunction n else n

inc n = n + 1
double n = n * 2
square n = n ^ 2

ifEvenInc n = ifEven inc n
ifEvenDouble n = ifEven double n
ifEvenSquare n = ifEven square n
