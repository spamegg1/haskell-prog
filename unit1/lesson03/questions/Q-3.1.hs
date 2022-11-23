-- Q3.1
-- Practice writing lambda functions by rewriting
-- each function in lesson 3 as a lambda expression.
simple :: a -> a
simple = (\x -> x)

makeChange :: Double -> Double -> Double
makeChange = (\owed given ->
    if given - owed > 0
    then given - owed
    else 0)

inc :: Int -> Int
inc = (\x -> x+1)

double :: Double -> Double
double = (\x -> x*2)

square :: Double -> Double
square = (\x -> x^2)

sumSquareOrSquareSum :: Int -> Int -> Int
sumSquareOrSquareSum x y =
    (\a b -> if a > b then a else b)
    (x^2 + y^2) ((x+y)^2)
