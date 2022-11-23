type Events = [String]
type Probs = [Double]

cartCombine :: (a -> b -> c) -> [a] -> [b] -> [c]
cartCombine func l1 l2 = zipWith func newL1 cycledL2
    where
        nToAdd = length l2
        repeatedL1 = map (take nToAdd . repeat) l1
        newL1 = concat repeatedL1
        cycledL2 = cycle l2

combineEvents :: Events -> Events -> Events
combineEvents = cartCombine (\x y -> concat [x, "-", y])

combineProbs :: Probs -> Probs -> Probs
combineProbs = cartCombine (*)
