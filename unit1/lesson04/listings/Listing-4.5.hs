import Data.List

names = [("Ian", "Curtis"),
        ("Bernard","Sumner"),
        ("Peter", "Hook"),
        ("Stephen","Morris")]

compareLastNames :: (String, String) -> (String, String) -> Ordering
compareLastNames name1 name2 =
    if lastName1 > lastName2 then GT
    else if lastName1 < lastName2 then LT
    else EQ
  where
    lastName1 = snd name1
    lastName2 = snd name2

-- sortBy compareLastNames names
