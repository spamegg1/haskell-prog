-- Use flip and partial application to create a function called
-- subtract2 that removes 2 from whatever number is passed in to it.

subtract2 :: Int -> Int
subtract2 = flip (-) 2
