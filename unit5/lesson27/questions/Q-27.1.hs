-- Q27.1
-- When we introduced parameterized types in lesson 15, you used a minimal
-- type Box as the example:
data Box a = Box a deriving Show
-- Implement the Functor type class for Box .
-- Then implement morePresents , which changes a
-- box from type Box a to one of type Box [a] ,
-- which has n copies of the original value in the
-- box in a list. Make sure to use fmap to implement this.

-- Answer:
instance Functor Box where
    fmap func (Box a) = Box (func a)

morePresents :: Int -> Box a -> Box [a]
morePresents n = fmap (\x -> take n $ cycle [x])

-- *Main> x = Box 3
-- *Main> morePresents 5 x
-- Box [3,3,3,3,3]
