data FourLetterAlphabet = L1 | L2 | L3 | L4 deriving (Show, Enum, Bounded)

message :: [FourLetterAlphabet]
message = [L1, L3, L4, L1, L1, L2]
