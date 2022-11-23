type Cup = (Int -> Int) -> Int

cup :: Int -> Cup
cup flOz = \message -> message flOz

-- GHCi> aCup = cup 6
