-- Q27.2
-- Now suppose you have a simple box like this:
-- myBox :: Box Int
-- myBox = Box 1
-- Use fmap to put the value in your Box in another Box.
-- Then define a function unwrap that
-- takes a value out of a box,
-- and use fmap on that function to get your original box.
-- Here’s how your code should work in GHCi:
-- GHCi> wrapped = fmap ? myBox
-- GHCi> wrapped
-- Box (Box 1)
-- GHCi> fmap unwrap wrapped
-- Box 1

-- Answer:
data Box a = Box a deriving Show

instance Functor Box where
    fmap func (Box a) = Box (func a)

myBox :: Box Int
myBox = Box 1

myBoxBox :: Box (Box Int)
myBoxBox = fmap Box myBox

unwrap :: Box a -> a
unwrap (Box x) = x
