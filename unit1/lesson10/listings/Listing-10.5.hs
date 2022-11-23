type Cup = (Int -> Int) -> Int

cup :: Int -> Cup
cup flOz = \message -> message flOz

coffeeCup :: Cup
coffeeCup = cup 12

getOz :: Cup -> Int
getOz aCup = aCup (\flOz -> flOz)

drink :: Cup -> Int -> Cup
drink aCup ozDrank =
    if ozDiff >= 0
    then cup ozDiff
    else cup 0
  where
    flOz = getOz aCup
    ozDiff = flOz - ozDrank

-- GHCi> afterBigGulp = drink coffeeCup 20
-- GHCi> getOz afterBigGulp
-- 0
