-- Q6.3
-- Write a function inFirstHalf that returns True if an element
-- is in the first half of a list, and otherwise returns False .

inFirstHalf :: Eq a => a -> [a] -> Bool
inFirstHalf elt list = let
    mid = div (length list) 2
    in elem elt (take mid list)
