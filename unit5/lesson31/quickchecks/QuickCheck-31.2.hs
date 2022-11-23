-- Create a Candidate type and see whether that candidate is viable.

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

-- Answer
x = Candidate {
    candidateId = 5, codeReview = B, cultureFit = D, education = PhD
}

y = viable x -- False
