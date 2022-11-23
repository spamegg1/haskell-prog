head :: [a] -> a
head (x : _) = x
head [] = error "head"
