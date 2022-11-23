-- Q12.2
-- Implement a patientSummary function that uses your final Patient type.
-- patientSummary should output a string that looks like this:
-- **************
-- Patient Name: Smith, John
-- Sex: Male
-- Age: 46
-- Height: 72 in.
-- Weight: 210 lbs.
-- Blood Type: AB+
-- **************
-- If you need to, feel free to create useful helper functions.

import PatientTypes

data Patient = Patient {name :: Name,
                        sex :: Sex,
                        age :: Int,
                        height :: Int,
                        weight :: Int,
                        bloodType :: BloodType }

showName :: Name -> String
showName (Name f l) = l ++ ", " ++ f
showName (NameWithMiddle f m l) = l ++ ", " ++ f ++ " " ++ m

showSex :: Sex -> String
showSex Male = "Male"
showSex Female = "Female"

showABO :: ABOType -> String
showABO A = "A"
showABO B = "B"
showABO AB = "AB"
showABO O = "O"

showRH :: RhType -> String
showRH Pos = "+"
showRH Neg = "-"

showBT :: BloodType -> String
showBT (BloodType abo rh) = (showABO abo) ++ (showRH rh)

patientSummary :: Patient -> String
patientSummary p = "**************\n" ++
    "Patient Name: " ++ showName (name p) ++ "\n" ++
    "Sex: " ++ showSex (sex p) ++ "\n" ++
    "Age: " ++ show (age p) ++ "\n" ++
    "Height: " ++ show (height p) ++ "in.\n" ++
    "Weight: " ++ show (weight p) ++ "lbs.\n" ++
    "Blood Type: " ++ showBT (bloodType p) ++ "\n" ++
    "**************"

-- jackieSmith :: Patient
-- jackieSmith = Patient {name = Name "Jackie" "Smith"
--                      , age = 43
--                      , sex = Female
--                      , height = 62
--                      , weight = 115
--                      , bloodType = BloodType O Neg }

-- patientSummary jackieSmith
