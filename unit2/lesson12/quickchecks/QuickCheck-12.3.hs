-- Show Jackie Smith’s name.
import PatientTypes

data Patient = Patient {name :: Name,
                        sex :: Sex,
                        age :: Int,
                        height :: Int,
                        weight :: Int,
                        bloodType :: BloodType }

jackieSmith :: Patient
jackieSmith = Patient {name = Name "Jackie" "Smith"
                     , age = 43
                     , sex = Female
                     , height = 62
                     , weight = 115
                     , bloodType = BloodType O Neg }

showName :: Name -> String
showName (Name f l) = f ++ " " ++ l
showName (NameWithMiddle f m l) = f ++ " " ++ m ++ " " ++ l

-- Answer:
-- showName (name jackieSmith)
