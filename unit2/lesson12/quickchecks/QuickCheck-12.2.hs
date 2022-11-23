-- Create a Jane Elizabeth Smith patient by using whatever reasonable values
-- you like.
import PatientTypes

data Patient = Patient Name Sex Int Int Int BloodType

janeESmith :: Patient
janeESmith = Patient (NameWithMiddle "Jane" "Elizabeth" "Smith")
                Female 28 62 140 (BloodType A Neg)
