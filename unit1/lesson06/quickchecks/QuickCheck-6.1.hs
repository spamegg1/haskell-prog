-- True or false: You can compile and run a program with the variable
-- backwardsInfinity = reverse [1..]

-- Answer: True.
-- Even though you’re reversing an infinite list, you’re never
-- calling this code, so the infinite list is never evaluated.
-- If you loaded this code into GHCi and typed the following
-- GHCi> backwardsInfinity
-- you’d have a problem, as the program would need to
-- evaluate this argument to print it out.
