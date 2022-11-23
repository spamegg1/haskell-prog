import Control.Monad

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

data Teacher = Teacher { teacherId :: Int, teacherName :: Name } deriving Show

data Course = Course {
    courseId :: Int,
    courseTitle :: String,
    teacher :: Int
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

teachers :: [Teacher]
teachers = [
    Teacher 100 (Name "Simone" "De Beauvoir"),
    Teacher 200 (Name "Susan" "Sontag")
    ]

courses :: [Course]
courses = [
    Course 101 "French" 100,
    Course 201 "English" 200
    ]

_select :: (a -> b) -> [a] -> [b]
_select prop vals = do
    val <- vals
    return $ prop val

_where :: (a -> Bool) -> [a] -> [a]
_where test vals = do
    val <- vals
    guard $ test val
    return val

startsWith :: Char -> String -> Bool
startsWith char string = char == head string

_join :: Eq c => [a] -> [b] -> (a -> c) -> (b -> c) -> [(a, b)]
_join data1 data2 prop1 prop2 = do
    d1 <- data1
    d2 <- data2
    guard (prop1 d1 == prop2 d2)
    return (d1, d2)

joinData :: [(Teacher, Course)]
joinData = _join teachers courses teacherId teacher

whereResult :: [(Teacher, Course)]
whereResult = _where ((== "English") . courseTitle . snd) joinData

selectResult :: [Name]
selectResult = _select (teacherName . fst) whereResult

_hinq :: ([tc] -> [n]) -> [tc] -> ([tc] -> [tc]) -> [n]
_hinq selectQuery joinQuery whereQuery = selectQuery $ whereQuery joinQuery

finalResult :: [Name]
finalResult = _hinq
    (_select (teacherName . fst))               -- [(Teacher, Course)] -> [Name]
    (_join teachers courses teacherId teacher)            -- [(Teacher, Course)]
    (_where ((== "English") . courseTitle . snd)) -- [(Teacher, Course)] -> [(Teacher, Course)]
