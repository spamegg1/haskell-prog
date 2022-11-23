cartCombine :: (a -> b -> c) -> [a] -> [b] -> [c]
cartCombine func l1 l2 = zipWith func newL1 cycledL2
    where
        nToAdd = length l2
        repeatedL1 = map (take nToAdd . repeat) l1
        newL1 = concat repeatedL1
        cycledL2 = cycle l2
