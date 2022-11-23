myHead :: [a] -> a
myHead (x:xs) = x
myHead [] = error "No head for empty list"
