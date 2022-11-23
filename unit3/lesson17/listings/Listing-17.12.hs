type Events = [String]
type Probs = [Double]

data PTable = PTable Events Probs

createPTable :: Events -> Probs -> PTable
createPTable events probs = PTable events normalizedProbs
    where normalizedProbs = map (/ sum probs) probs

showPair :: String -> Double -> String
showPair event prob = concat [event, "|", show prob, "\n"]

instance Show PTable where
    show (PTable events probs) = concat (zipWith showPair events probs)

-- GHCi> createPTable ["heads","tails"] [0.5,0.5]
-- heads|0.5
-- tails|0.5
