type FirstName = String
type MiddleName = String
type LastName = String

data Sex = Male | Female
data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType
data Name = Name FirstName LastName
            | NameWithMiddle FirstName MiddleName LastName

data Patient = Patient Name Sex Int Int Int BloodType
