-- Q31.1
-- At the end of lesson 21, you saw the following program used to calculate the
-- cost of pizza:
type Pizza = (Double, Double)

areaGivenDiameter :: Double -> Double
areaGivenDiameter size = pi * (size / 2)^2

costPerInch :: Pizza -> Double
costPerInch (size, cost) = cost / areaGivenDiameter size

comparePizzas :: Pizza -> Pizza -> Pizza
comparePizzas p1 p2 = if costP1 < costP2 then p1 else p2
    where
        costP1 = costPerInch p1
        costP2 = costPerInch p2

describePizza :: Pizza -> String
describePizza (size, cost) =
    "The " ++ show size ++ " inch pizza is cheaper at "
    ++ show costSqInch ++ " per square inch"
    where costSqInch = costPerInch (size, cost)

main2 :: IO ()
main2 = do
    putStrLn "What is the size of pizza 1"
    size1 <- getLine
    putStrLn "What is the cost of pizza 1"
    cost1 <- getLine
    putStrLn "What is the size of pizza 2"
    size2 <- getLine
    putStrLn "What is the cost of pizza 2"
    cost2 <- getLine
    let pizza1 = (read size1, read cost1)
    let pizza2 = (read size2, read cost2)
    let betterPizza = comparePizzas pizza1 pizza2
    putStrLn (describePizza betterPizza)
-- Desugar this code to use >>=, >>, return and lambda functions rather than
-- do-notation.

-- Answer:
-- (>>=)    :: m a -> (a -> m b) -> m b
--  (>>)    :: m a ->     m b    -> m b
-- return   ::   a -> m a
-- getLine  :: IO String
-- putStrLn :: String -> IO ()
main :: IO ()
main =
    putStrLn "What is the size of pizza 1" >>
    getLine >>=
    (\size1 ->
        putStrLn "What is the cost of pizza 1" >>
        getLine >>=
        (\cost1 ->
            putStrLn "What is the size of pizza 2" >>
            getLine >>=
            (\size2 ->
                putStrLn "What is the cost of pizza 2" >>
                getLine >>=
                (\cost2 ->
                    (\pizza1 ->
                        (\pizza2 ->
                            (\betterPizza ->
                                putStrLn $ describePizza betterPizza
                            )
                            (comparePizzas pizza1 pizza2)
                        )
                        (read size2, read cost2)
                    )
                    (read size1, read cost1)
                )
            )
        )
    )
