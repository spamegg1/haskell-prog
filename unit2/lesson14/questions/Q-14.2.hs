-- Q14.2
-- Define a five-sided die ( FiveSidedDie type).
-- Then define a type class named Die and at least one method
-- that would be useful to have for a die.
-- Also include superclasses you think make sense for a die.
-- Finally, make your FiveSidedDie an instance of Die .

-- Answer:
data FiveSidedDie = Side1 | Side2 | Side3 | Side4 | Side5
    deriving (Enum, Eq, Show)

class (Eq a, Enum a) => Die a where
    roll :: Int -> a

instance Die FiveSidedDie where
    roll n = toEnum (n `mod` 5)
