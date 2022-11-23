import qualified Data.Map as Map

data Grade = F | D | C | B | A deriving (Eq, Show, Ord, Enum, Read)

data Degree = HS | BA | MS | PhD deriving (Eq, Show, Ord, Enum, Read)

data Candidate = Candidate {
    candidateId :: Int,
    codeReview :: Grade,
    cultureFit :: Grade,
    education :: Degree
} deriving Show

viable :: Candidate -> Bool
viable candidate = all (== True) tests
    where
        passedCoding = codeReview candidate > B
        passedCultureFit = cultureFit candidate > C
        educationMin = education candidate >= MS
        tests = [passedCoding, passedCultureFit, educationMin]

readInt :: IO Int
readInt = getLine >>= (return . read)

readGrade :: IO Grade
readGrade = getLine >>= (return . read)

readDegree :: IO Degree
readDegree = getLine >>= (return . read)

readCandidate :: IO Candidate
readCandidate = do
    putStrLn "enter id:"
    canId <- readInt
    putStrLn "enter code grade:"
    codeGrade <- readGrade
    putStrLn "enter culture fit grade:"
    cultureGrade <- readGrade
    putStrLn "enter education:"
    degree <- readDegree
    return Candidate {
        candidateId = canId,
        codeReview = codeGrade,
        cultureFit = cultureGrade,
        education = degree
    }

assessCandidateIO :: IO String
assessCandidateIO = do
    candidate <- readCandidate
    let passed = viable candidate
    let statement = if passed then "passed" else "failed"
    return statement

candidate1 :: Candidate
candidate1 = Candidate {
    candidateId = 1,
    codeReview = A,
    cultureFit = A,
    education = BA
}

candidate2 :: Candidate
candidate2 = Candidate {
    candidateId = 2,
    codeReview = C,
    cultureFit = A,
    education = PhD
}

candidate3 :: Candidate
candidate3 = Candidate {
    candidateId = 3,
    codeReview = A,
    cultureFit = B,
    education = MS
}

candidateDB :: Map.Map Int Candidate
candidateDB = Map.fromList [(1, candidate1), (2, candidate2), (3, candidate3)]

assessCandidateMaybe :: Int -> Maybe String
assessCandidateMaybe canId = do
    candidate <- Map.lookup canId candidateDB
    let passed = viable candidate
    let statement = if passed then "passed" else "failed"
    return statement

candidates :: [Candidate]
candidates = [candidate1, candidate2, candidate3]

assessCandidates :: [Candidate] -> [String]
assessCandidates candidates =
    map (\x -> if x then "passed" else "failed") passed
    where passed = map viable candidates
