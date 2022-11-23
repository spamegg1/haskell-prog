data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType

canDonateTo :: BloodType -> BloodType -> Bool
canDonateTo (BloodType O _) _ = True                          -- Universal donor
canDonateTo _ (BloodType AB _) = True                      -- Universal receiver
canDonateTo (BloodType A _) (BloodType A _) = True
canDonateTo (BloodType B _) (BloodType B _) = True
canDonateTo _ _ = False --otherwise
