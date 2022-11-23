incMaybeInt :: Maybe Int -> Maybe Int
incMaybeInt (Just n) = Just (n+1)
incMaybeInt Nothing = Nothing
