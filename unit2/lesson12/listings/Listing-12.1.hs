patientInfo :: String -> String -> Int -> Int -> String
patientInfo fname lname age height = name ++ " " ++ ageHeight
    where
    name = lname ++ ", " ++ fname
    ageHeight = "(" ++ show age ++ "yrs. " ++ show height ++ "in.)"
