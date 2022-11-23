data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6

show :: SixSidedDie -> String
show S1 = "one"
show S2 = "two"
show S3 = "three"
show S4 = "four"
show S5 = "five"
show S6 = "six"


data TwoSidedDie = One | Two

show :: TwoSidedDie -> String
show One = "one"
show Two = "two"
