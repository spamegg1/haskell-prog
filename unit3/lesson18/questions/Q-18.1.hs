-- Q18.1
-- For the types Triple and Box , implement a function similar to
-- map , tripleMap , and boxMap .

data Box a = Box a deriving Show
data Triple a = Triple a a a deriving Show

-- Answer:
tripleMap :: (a -> b) -> Triple a -> Triple b
tripleMap f (Triple x y z) = Triple (f x) (f y) (f z)

boxMap :: (a -> b) -> Box a -> Box b
boxMap f (Box x) = Box (f x)
