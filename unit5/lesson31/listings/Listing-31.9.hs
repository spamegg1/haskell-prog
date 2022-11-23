data Grade = F | D | C | B | A deriving (Eq, Show, Ord, Enum, Read)

data Degree = HS | BA | MS | PhD deriving (Eq, Show, Ord, Enum, Read)

data Candidate = Candidate {
    candidateId :: Int,
    codeReview :: Grade,
    cultureFit :: Grade,
    education :: Degree
} deriving Show

readInt :: IO Int
readInt = getLine >>= (return . read)

readGrade :: IO Grade
readGrade = getLine >>= (return . read)

readDegree :: IO Degree
readDegree = getLine >>= (return . read)
