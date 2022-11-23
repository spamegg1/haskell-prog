type PatientName = (String, String)

firstName :: PatientName -> String
firstName patient = fst patient

lastName :: PatientName -> String
lastName patient = snd patient
