-- Use fmap or <$> to reverse a Maybe String.

-- Answer:
x = reverse <$> Just "cat"
y = reverse <$> Nothing

-- *Main> x
-- Just "tac"
-- *Main> y
-- Nothing
