-- Implement remove, which removes elements that pass the test.

remove :: (a -> Bool) -> [a] -> [a]
remove _ [] = []
remove test (x : xs) =
    if test x
    then remove test xs
    else x : (remove test xs)
