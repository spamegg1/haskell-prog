myFilter :: (a -> Bool) -> [a] -> [a]
myFilter test [] = []
myFilter test (x:xs) =
    if test x
    then x : (myFilter test xs)
    else myFilter test xs
