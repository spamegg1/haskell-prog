-- Q19.2
-- Write a version of map that works for Maybe types, called maybeMap .

-- Answer: this is what I thought they were asking
-- maybeMap :: (a -> b) -> [Maybe a] -> [Maybe b]
-- maybeMap _ [] = []
-- maybeMap f (head : tail) = case head of
--     Just a' -> Just (f a') : maybeMap f tail
--     Nothing -> Nothing : maybeMap f tail

-- this is what they were asking
maybeMap :: (a -> b) -> Maybe a -> Maybe b
maybeMap f (Just x) = Just (f x)
maybeMap _ Nothing = Nothing

