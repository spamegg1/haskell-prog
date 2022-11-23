-- Write a function numOrZero that takes a Maybe Int and returns 0 if it’s
-- nothing, and otherwise returns the value.

-- Answer:
numOrZero :: Maybe Int -> Int
numOrZero (Just n) = n
numOrZero Nothing = 0
