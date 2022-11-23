-- Rewrite readGrade with do-notation.
data Grade = F | D | C | B | A deriving (Eq, Show, Ord, Enum, Read)

data Degree = HS | BA | MS | PhD deriving (Eq, Show, Ord, Enum, Read)

data Candidate = Candidate {
    candidateId :: Int,
    codeReview :: Grade,
    cultureFit :: Grade,
    education :: Degree
} deriving Show

-- Answer:
readGrade :: IO Grade
readGrade = do
    line <- getLine
    return $ read line
