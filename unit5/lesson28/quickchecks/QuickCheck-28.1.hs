-- Write addMaybe for adding two Maybe Ints.

-- Answer:
addMaybe :: Maybe Int -> Maybe Int -> Maybe Int
addMaybe (Just int1) (Just int2) = Just (int1 + int2)
addMaybe _ _ = Nothing
