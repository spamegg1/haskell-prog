-- Q14.1
-- Note that Enum doesn’t require either Ord or Eq , even though it maps
-- types to Int values (which implement both Ord and Eq ).
-- Ignoring the fact that you can easily use deriving for Eq and Ord ,
-- use the derived implementation of Enum to make
-- manually defining Eq and Ord much easier.

-- Answer:
-- Suppose you have a type like this:
data Number = One | Two | Three deriving Enum
-- Now you can use fromEnum to convert this into an Int .
-- This makes implementing Eq easy as well as Ord :
instance Eq Number where
    (==) num1 num2 = (fromEnum num1) == (fromEnum num2)
instance Ord Number where
    compare num1 num2 = compare (fromEnum num1) (fromEnum num2)
