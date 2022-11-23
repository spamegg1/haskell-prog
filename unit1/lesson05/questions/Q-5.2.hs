-- Q5.2 Even if Haskell didn’t have partial application,
-- you could hack together some approximations.
-- Following a similar pattern to flipBinaryArgs (figure 5.6),
-- write a function binaryPartialApplication that takes a
-- binary function and one argument and returns a
-- new function waiting for the missing argument.

binaryPartialApplication :: (a -> b -> c) -> a -> b -> c
binaryPartialApplication binFun arg1 = (\arg2 -> binFun arg1 arg2)
