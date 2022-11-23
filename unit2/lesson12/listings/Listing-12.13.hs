import PatientTypes

data Patient = Patient Name Sex Int Int Int BloodType

getName :: Patient -> Name
getName (Patient n _ _ _ _ _) = n

getAge :: Patient -> Int
getAge (Patient _ _ a _ _ _) = a

getBloodType :: Patient -> BloodType
getBloodType (Patient _ _ _ _ _ bt) = bt
