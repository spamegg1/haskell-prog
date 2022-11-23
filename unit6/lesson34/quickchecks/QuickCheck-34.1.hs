-- Suppose you need to store the length of an object as a variable.
-- For example:
length :: Int
length = 8
-- How would you use that value without conflicting with the existing length
-- function in Prelude?

-- Answer:
doubleLength :: Int
doubleLength = Main.length * 2
