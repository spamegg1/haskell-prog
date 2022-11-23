-- Q11.1
-- What is the type signature for filter ? How is it different from map ?
filter :: (a -> Bool) -> [a] -> [a]
-- If you look at map , you can see there are two differences:
map :: (a -> b) -> [a] -> [b]
-- First is that the function passed into filter must return a Bool .
-- Second is that map can transform the type of the list, whereas filter can’t.
