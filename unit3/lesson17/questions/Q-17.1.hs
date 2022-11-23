-- Q17.1
-- Your current implementation of Color doesn’t contain an identity element.
-- Modify the code in this unit so that Color does have an identity element,
-- and then make Color an instance of Monoid .

-- this is my solution: the way it's defined, Brown is already an identity.
-- also mappend and mconcat are not needed.
-- also removed redundant (<>) statements. They are all covered by (<>) a b.
data Color = Red | Yellow | Blue | Green | Purple | Orange | Brown
    deriving (Eq, Show)

instance Semigroup Color where
    (<>) a b | a == b = a
            | all (`elem` [Red, Blue, Purple]) [a, b] = Purple
            | all (`elem` [Blue, Yellow, Green]) [a, b] = Green
            | all (`elem` [Red, Yellow, Orange]) [a, b] = Orange
            | otherwise = Brown

instance Monoid Color where
    mempty = Brown
    --mappend = (<>)

-- this is the book's solution (a lot of the (<>) statements are redundant):
-- data Colors = Red |
--             Yellow |
--             Blue |
--             Green |
--             Purple |
--             Orange |
--             Brown |
--             Clear deriving (Show,Eq)

-- instance Semigroup Colors where
--     (<>) Clear any = any
--     (<>) any Clear = any
--     (<>) Red Blue = Purple
--     (<>) Blue Red = Purple
--     (<>) Yellow Blue = Green
--     (<>) Blue Yellow = Green
--     (<>) Yellow Red = Orange
--     (<>) Red Yellow = Orange
--     (<>) a b | a == b = a
--             | all (`elem` [Red,Blue,Purple]) [a,b] = Purple
--             | all (`elem` [Blue,Yellow,Green]) [a,b] = Green
--             | all (`elem` [Red,Yellow,Orange]) [a,b] = Orange
--             | otherwise = Brown

-- instance Monoid Colors where
--     mempty = Clear
--     mappend col1 col2 = col1 <> col2
