-- Q5.1
-- Now that you know about partial application,
-- you no longer need to use genIfEvenX .
-- Redefine ifEvenInc , ifEvenDouble , and ifEvenSquare
-- by using ifEven and partial application.

ifEven :: (Int -> Int) -> Int -> Int
ifEven myFunction n = if even n then myFunction n else n

ifEvenInc = ifEven (+1)
ifEvenDouble = ifEven (*2)
ifEvenSquare = ifEven (^2)

