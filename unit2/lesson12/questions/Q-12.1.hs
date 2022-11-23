-- Q12.1
-- Write a function similar to canDonateTo that takes two patients as arguments
-- rather than two BloodTypes .

import PatientTypes

data Patient = Patient {name :: Name,
                        sex :: Sex,
                        age :: Int,
                        height :: Int,
                        weight :: Int,
                        bloodType :: BloodType }

canDonateTo :: BloodType -> BloodType -> Bool
canDonateTo (BloodType O _) _ = True                          -- Universal donor
canDonateTo _ (BloodType AB _) = True                      -- Universal receiver
canDonateTo (BloodType A _) (BloodType A _) = True
canDonateTo (BloodType B _) (BloodType B _) = True
canDonateTo _ _ = False --otherwise


-- Answer:
patientCanDonateTo :: Patient -> Patient -> Bool
patientCanDonateTo p1 p2 = canDonateTo (bloodType p1) (bloodType p2)
