-- Q6.1
-- Haskell has a function called repeat that
-- takes a value and repeats it infinitely.
-- Using the functions you’ve learned so far,
-- implement your own version of repeat .
myRepeat :: a -> [a]
myRepeat value = cycle [value]
