xorBool :: Bool -> Bool -> Bool
xorBool value1 value2 = (value1 || value2) && (not (value1 && value2))

xorPairs :: (Bool, Bool) -> Bool
xorPairs (v1, v2) = xorBool v1 v2
