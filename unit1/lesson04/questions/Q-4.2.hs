-- Q4.2
-- Define a new location function for Washington, DC and add it to
-- getLocationFunction . In the DC function,
-- everyone’s names must be followed by Esq.

sfOffice :: (String, String) -> String
sfOffice name =
    if lastName < "L" then
        nameText ++ " - PO Box 1234 - San Francisco, CA 94111"
    else nameText ++ " - PO Box 1010 - San Francisco, CA 94109"
  where
    lastName = snd name
    nameText = (fst name) ++ " " ++ lastName

nyOffice :: (String, String) -> String
nyOffice name = nameText ++ ": PO Box 789 - New York, NY, 10013"
    where nameText = (fst name) ++ " " ++ (snd name)

renoOffice :: (String, String) -> String
renoOffice name = nameText ++ " - PO Box 456 - Reno, NV 89523"
    where nameText = snd name

dcOffice :: (String, String) -> String
dcOffice name = nameText ++ " - PO Box 1337 - Washington, DC 20001"
  where nameText = (fst name) ++ " " ++ (snd name) ++ ", Esq."

getLocationFunction :: String -> (String, String) -> String
getLocationFunction location = case location of
    "ny" -> nyOffice
    "sf" -> sfOffice
    "reno" -> renoOffice
    "dc" -> dcOffice
    _ -> (\name -> (fst name) ++ " " ++ (snd name))
