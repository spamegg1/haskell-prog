import Control.Monad                                      -- for Monad and guard
import Control.Applicative                                    -- for Alternative

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

data Enrollment = Enrollment { student :: Int, course :: Int } deriving Show

data HINQ m a b =
    HINQ (m a -> m b) (m a) (m a -> m a) |
    HINQ_ (m a -> m b) (m a)

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

enrollments :: [Enrollment]
enrollments = [
    (Enrollment 1 101),
    (Enrollment 2 101),
    (Enrollment 2 201),
    (Enrollment 3 101),
    (Enrollment 4 201),
    (Enrollment 4 101),
    (Enrollment 5 101),
    (Enrollment 6 201)
    ]

_select :: Monad m => (a -> b) -> m a -> m b
_select prop vals = do
    val <- vals
    return $ prop val

_where :: (Monad m, Alternative m) => (a -> Bool) -> m a -> m a
_where test vals = do
    val <- vals
    guard $ test val
    return val

startsWith :: Char -> String -> Bool
startsWith char string = char == head string

_join :: (Monad m, Alternative m, Eq c) =>
    m a -> m b -> (a -> c) -> (b -> c) -> m (a, b)
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

_hinq :: (Monad m, Alternative m) => (m a -> m b) -> m a -> (m a -> m a) -> m b
_hinq selectQuery joinQuery whereQuery = selectQuery $ whereQuery joinQuery

finalResult :: [Name]
finalResult = _hinq
    (_select (teacherName . fst))               -- [(Teacher, Course)] -> [Name]
    (_join teachers courses teacherId teacher)            -- [(Teacher, Course)]
    (_where ((== "English") . courseTitle . snd)) -- [(Teacher, Course)] -> [(Teacher, Course)]

teacherFirstName :: [String]
teacherFirstName = _hinq
    (_select firstName)                                    -- [Name] -> [String]
    finalResult                                                        -- [Name]
    (_where (\_ -> True))                                    -- [Name] -> [Name]

runHINQ :: (Monad m, Alternative m) => HINQ m a b -> m b
runHINQ (HINQ  sel jo wh) = _hinq sel jo wh
runHINQ (HINQ_ sel jo   ) = _hinq sel jo (_where (\_ -> True))

query1 :: HINQ [] (Teacher, Course) Name
query1 = HINQ
    (_select (teacherName . fst))               -- [(Teacher, Course)] -> [Name]
    (_join teachers courses teacherId teacher)            -- [(Teacher, Course)]
    (_where ((== "English") . courseTitle . snd)) -- [(Teacher, Course)] -> [(Teacher, Course)]

query2 :: HINQ [] Teacher Name
query2 = HINQ_ (_select teacherName) teachers

possibleTeacher :: Maybe Teacher
possibleTeacher = Just (head teachers)

possibleCourse :: Maybe Course
possibleCourse = Just (head courses)

maybeQuery1 :: HINQ Maybe (Teacher, Course) Name
maybeQuery1 = HINQ
    (_select (teacherName . fst))       -- Maybe (Teacher, Course) -> Maybe Name
    (_join possibleTeacher possibleCourse teacherId teacher) -- Maybe (Teacher, Course)
    (_where ((== "French") . courseTitle . snd)) -- Maybe (Teacher, Course) -> -- Maybe (Teacher, Course)

missingCourse :: Maybe Course
missingCourse = Nothing

maybeQuery2 :: HINQ Maybe (Teacher, Course) Name
maybeQuery2 = HINQ
    (_select (teacherName . fst))       -- Maybe (Teacher, Course) -> Maybe Name
    (_join possibleTeacher missingCourse teacherId teacher) -- Maybe (Teacher, Course)
    (_where ((== "French") . courseTitle . snd)) -- Maybe (Teacher, Course) -> Maybe (Teacher, Course)

studentEnrollmentsQuery :: HINQ [] (Student, Enrollment) (Name, Int)
studentEnrollmentsQuery = HINQ_
    (_select (\(st, en) -> (studentName st, course en))) -- [(Student, Enrollment)] -> [(Name, Int)]
    (_join students enrollments studentId student)    -- [(Student, Enrollment)]

studentEnrollments :: [(Name, Int)]
studentEnrollments = runHINQ studentEnrollmentsQuery

englishStudentsQ :: HINQ [] ((Name, Int), Course) Name
englishStudentsQ = HINQ
    (_select (fst . fst))                   -- [((Name, Int), Course)] -> [Name]
    (_join studentEnrollments courses snd courseId)   -- [((Name, Int), Course)]
    (_where ((== "English") . courseTitle . snd)) -- [((Name, Int), Course)] -> [Name]
