x = (*) <$> Just 6 <*> Just 7 -- Just 42
y = div <$> Just 6 <*> Just 7 -- Just 0
z = mod <$> Just 6 <*> Just 7 -- Just 6

-- pure :: Int -> Maybe Int
a = pure 6 :: Maybe Int -- Just 6

-- (Int -> Int) <$> Maybe Int
b = (6+) <$> Just 5      -- Just 11

-- (6+) :: Int -> Int
-- pure (6+) :: Maybe (Int -> Int)
-- pure (6+) <*> :: Maybe Int -> Maybe Int
c = pure (6+) <*> Just 5 -- Just 11

data Blah a b = Blah a b
