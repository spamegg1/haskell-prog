calcChange :: Double -> Double -> Double
calcChange owed given =
    if given - owed > 0
    then given - owed
    else 0
