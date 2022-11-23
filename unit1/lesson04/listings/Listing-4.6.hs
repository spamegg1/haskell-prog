addressLetter :: (String, String) -> String -> String
addressLetter name location = nameText ++ " - " ++ location
    where nameText = (fst name) ++ " " ++ (snd name)

-- addressLetter ("Bob","Smith") "PO Box 1234 - San Francisco, CA, 94111"
