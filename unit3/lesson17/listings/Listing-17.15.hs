type Events = [String]
type Probs = [Double]
data PTable = PTable Events Probs

createPTable :: Events -> Probs -> PTable
createPTable events probs = PTable events normalizedProbs
    where normalizedProbs = map (/ sum probs) probs

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

showPair :: String -> Double -> String
showPair event prob = concat [event, "|", show prob, "\n"]

instance Show PTable where
    show (PTable events probs) = concat (zipWith showPair events probs)

instance Semigroup PTable where
    (<>) ptable1 (PTable [] []) = ptable1
    (<>) (PTable [] []) ptable2 = ptable2
    (<>) (PTable e1 p1) (PTable e2 p2) = createPTable newEvents newProbs
            where
                newEvents = combineEvents e1 e2
                newProbs = combineProbs p1 p2
