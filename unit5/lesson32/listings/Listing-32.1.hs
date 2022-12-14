data Grade  = F  | D  | C  | B | A deriving (Eq, Ord, Enum, Show, Read)
data Degree = HS | BA | MS | PhD   deriving (Eq, Ord, Enum, Show, Read)
data Candidate = Candidate {
    candidateId :: Int,
    codeReview :: Grade,
    cultureFit :: Grade,
    education :: Degree } deriving Show

viable :: Candidate -> Bool
viable candidate = all (== True) tests where
    passedCoding = codeReview candidate > B
    passedCultureFit = cultureFit candidate > C
    educationMin = education candidate >= MS
    tests = [passedCoding, passedCultureFit, educationMin]

assessCandidateList :: [Candidate] -> [String]
assessCandidateList candidates = do
    candidate <- candidates
    let passed = viable candidate
    let statement = if passed then "passed" else "failed"
    return statement
