data Name = Name { firstName :: String, lastName :: String }
instance Show Name where
    show (Name first last) = first ++ " " ++ last

data GradeLevel = Freshman | Sophomore | Junior | Senior
    deriving (Eq, Ord, Enum, Show)
