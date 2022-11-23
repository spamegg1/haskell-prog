myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f init [] = init
myFoldr f init (x:xs) = f x rightResult
    where rightResult = myFoldr f init xs
