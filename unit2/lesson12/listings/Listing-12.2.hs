type FirstName = String
type LastName = String
type Age = Int
type Height = Int

patientInfo :: FirstName -> LastName -> Age -> Height -> String
patientInfo fname lname age height = name ++ " " ++ ageHeight
    where
    name = lname ++ ", " ++ fname
    ageHeight = "(" ++ show age ++ "yrs. " ++ show height ++ "in.)"
