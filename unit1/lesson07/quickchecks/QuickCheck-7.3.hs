-- Fill in this definition of myTail by using pattern matching,
-- and make sure to use _ where the value isn’t needed:
-- myTail (<fill in this>) = xs

myTail :: [a] -> [a]
myTail (_:xs) = xs
