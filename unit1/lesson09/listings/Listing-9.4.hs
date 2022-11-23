rcons :: [a] -> a -> [a]
rcons x y = y:x

myReverse :: [a] -> [a]
myReverse xs = foldl rcons [] xs
