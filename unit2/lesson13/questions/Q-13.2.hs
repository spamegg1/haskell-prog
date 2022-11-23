-- Q13.2
-- One type class we didn’t discuss is Enum .
-- Use :info to look at the definition of this type class,
-- as well as example members.
-- Now consider Int , which is an instance of both Enum and Bounded .
-- Given the following definition of inc :
inc :: Int -> Int
inc x = x + 1
-- and the succ function required by Enum ,
-- what’s the difference between inc and succ for Int ?

-- Answer:
-- You can see the difference if you try inc and succ on the maxBound of Int :
-- GHCi> inc maxBound :: Int
-- -9223372036854775808
-- GHCi> succ maxBound :: Int
-- *** Exception: Prelude.Enum.succ{Int}: tried to take ‘succ' of maxBound
-- Because there’s no true successor to a Bounded type, succ throws an error.
-- The inc function just rotates you back to the beginning.
