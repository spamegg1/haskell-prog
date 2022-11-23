-- Rewrite patientInfo to use your patientName type,
-- reducing the total arguments needed to three instead of four.
type PatientName = (String, String)
type Age = Int
type Height = Int

firstName :: PatientName -> String
firstName patient = fst patient

lastName :: PatientName -> String
lastName patient = snd patient

patientInfo :: PatientName -> Age -> Height -> String
patientInfo (fname, lname) age height = name ++ " " ++ ageHeight
    where
    name = lname ++ ", " ++ fname
    ageHeight = "(" ++ show age ++ "yrs. " ++ show height ++ "in.)"
