data Triple a = Triple a a a deriving Show

toList :: Triple a -> [a]
toList (Triple x y z) = [x, y, z]
