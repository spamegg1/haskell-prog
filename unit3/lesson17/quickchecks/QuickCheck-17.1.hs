-- Implement myAny by using function composition.
-- myAny tests that a property is True for at least one value in the list.
myAny :: (a -> Bool) -> [a] -> Bool
myAny testFunc = (foldr (||) False) . (map testFunc)
