type FirstName = String
type MiddleName = String
type LastName = String

data Name = Name FirstName LastName
            | NameWithMiddle FirstName MiddleName LastName

showName :: Name -> String
showName (Name f l) = f ++ " " ++ l
showName (NameWithMiddle f m l) = f ++ " " ++ m ++ " " ++ l

-- name1 = Name "Jerome" "Salinger"
-- name2 = NameWithMiddle "Jerome" "David" "Salinger"
-- GHCi> showName name1
-- "Jerome Salinger"
-- GHCi> showName name2
-- "Jerome David Salinger"

