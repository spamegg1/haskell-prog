type Cup = (Int -> Int) -> Int

cup :: Int -> Cup
cup flOz = \message -> message flOz

coffeeCup :: Cup
coffeeCup = cup 12

getOz :: Cup -> Int
getOz aCup = aCup (\flOz -> flOz)

-- GHCi> getOz coffeeCup
-- 12
