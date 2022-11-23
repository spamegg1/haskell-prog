-- Write the function reverseMaybe :: Maybe String -> Maybe String that
-- reverses a Maybe String and returns it as a Maybe String.

-- Answer:
reverseMaybe :: Maybe String -> Maybe String
reverseMaybe (Just string) = Just (reverse string)
reverseMaybe Nothing = Nothing
