-- Q17.2
-- If your Events and Probs types were data types and not just synonyms,
-- you could make them instances of Semigroup and Monoid ,
-- where combineEvents and combineProbs were the <> operator in each case.
-- Refactor these types and make instances of Semigroup and Monoid .

data Events = Events [String]
data Probs = Probs [Double]
data PTable = PTable Events Probs

cartCombine :: (a -> b -> c) -> [a] -> [b] -> [c]
cartCombine func l1 l2 = zipWith func newL1 cycledL2
    where
        nToAdd = length l2
        repeatedL1 = map (take nToAdd . repeat) l1
        newL1 = concat repeatedL1
        cycledL2 = cycle l2


combineEvents :: Events -> Events -> Events
combineEvents (Events e1) (Events e2) = Events combined where
    combined = cartCombine (\x y -> concat [x, "-", y]) e1 e2

instance Semigroup Events where
    (<>) = combineEvents

instance Monoid Events where
    mempty = Events []
    mappend = (<>)


combineProbs :: Probs -> Probs -> Probs
combineProbs (Probs p1) (Probs p2) = Probs (cartCombine (*) p1 p2)

instance Semigroup Probs where
    (<>) = combineProbs

instance Monoid Probs where
    mempty = Probs []
    mappend = (<>)


showPair :: Events -> Probs -> String
showPair (Events e) (Probs p) = concat (e ++ ["|", show p, "\n"])

instance Show PTable where
    show (PTable events probs) = showPair events probs


createPTable :: Events -> Probs -> PTable
createPTable (Events e) (Probs p) = PTable (Events e) (Probs normalizedProbs)
    where normalizedProbs = map (/ sum p) p

instance Semigroup PTable where
    (<>) ptable1 (PTable (Events []) (Probs [])) = ptable1
    (<>) (PTable (Events []) (Probs [])) ptable2 = ptable2
    (<>) (PTable e1 p1) (PTable e2 p2) = createPTable newEvents newProbs
            where
                newEvents = combineEvents e1 e2
                newProbs = combineProbs p1 p2

instance Monoid PTable where
    mempty = PTable (Events []) (Probs [])
    mappend = (<>)
