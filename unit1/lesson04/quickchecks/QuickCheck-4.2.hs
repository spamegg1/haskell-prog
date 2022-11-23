-- In compareLastNames, you didn’t handle the case of having two
-- last names that are the same but with different first names.
-- Modify the compareLastNamesfunction to compare first names
-- and use it to fix compareLastNames.

import Data.List

names = [("Ian", "Curtis"),
        ("Bernard","Sumner"),
        ("Peter", "Hook"),
        ("Stephen","Morris")]

compareLastNames :: (String, String) -> (String, String) -> Ordering
compareLastNames name1 name2 =
    if lastName1 > lastName2 then GT
    else if lastName1 < lastName2 then LT
    else if firstName1 > firstName2 then GT
    else if firstName1 < firstName2 then LT
    else EQ
  where
    lastName1 = snd name1
    lastName2 = snd name2
    firstName1 = fst name1
    firstName2 = fst name2

-- sortBy compareLastNames names

