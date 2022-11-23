-- Rewrite the following function to use a lambda function in place of where:
-- doubleDouble x = dubs*2
--     where dubs = x*2

doubleDouble :: Double -> Double
doubleDouble x = (\dubs -> dubs*2) x*2
