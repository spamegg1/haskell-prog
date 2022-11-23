-- Write a lambda function for cubing x and pass it to ifEven.

ifEven :: (Int -> Int) -> Int -> Int
ifEven myFunction x = if even x then myFunction x else x

ifEvenCube :: Int -> Int
ifEvenCube n = ifEven (\x -> x^3) n
