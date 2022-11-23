-- Q11.2
-- In Haskell, both tail and head have an error when called on an empty list.
-- You can write a version of tail that won’t fail but instead
-- return an empty list when called on an empty list.
-- Can you write a version of head that returns an empty list
-- when called on an empty list? To answer this,
-- start by writing out the type signatures of both head and tail .

-- Answer: NO.
head :: [a] -> a -- cannot return a list here.
tail :: [a] -> [a]

-- For tail , you can return the empty list if the list is empty:
safeTail :: [a] -> [a]
safeTail [] = []
safeTail (x:xs) = xs
-- You can’t do the same for head , because there’s no sane
-- default value for an element. You can’t return an empty list,
-- because an empty list is the same type as the elements of the
-- list. See lesson 37 for a more detailed discussion of this topic.
