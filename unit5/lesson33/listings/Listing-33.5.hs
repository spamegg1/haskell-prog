data Name = Name { firstName :: String, lastName :: String }
instance Show Name where
    show (Name first last) = first ++ " " ++ last

data GradeLevel = Freshman | Sophomore | Junior | Senior
    deriving (Eq, Ord, Enum, Show)

data Student = Student {
    studentId :: Int,
    gradeLevel :: GradeLevel,
    studentName :: Name
} deriving Show

students :: [Student]
students = [
    (Student 1 Senior    (Name "Audre" "Lorde")),
    (Student 2 Junior    (Name "Leslie" "Silko")),
    (Student 3 Freshman  (Name "Judith" "Butler")),
    (Student 4 Senior    (Name "Guy" "Debord")),
    (Student 5 Sophomore (Name "Jean" "Baudrillard")),
    (Student 6 Junior    (Name "Julia" "Kristeva"))
    ]

_select :: (a -> b) -> [a] -> [b]
_select prop vals = do
    val <- vals
    return $ prop val

-- GHCi> _select (firstName . studentName) students
-- ["Audre","Leslie","Judith","Guy","Jean","Julia"]
-- GHCi> _select gradeLevel students
-- [Senior,Junior,Freshman,Senior,Sophmore,Junior]
-- GHCi> _select (\x -> (studentName x, gradeLevel x)) students
-- [(Audre Lorde,Senior),(Leslie Silko,Junior),(Judith Butler,Freshman),
-- (Guy Debord,Senior),(Jean Baudrillard,Sophmore),(Julia Kristeva,Junior)]

