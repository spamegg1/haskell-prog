type Cup = (Int -> Int) -> Int

cup :: Int -> Cup
cup flOz = \message -> message flOz

coffeeCup :: Cup
coffeeCup = cup 12

getOz :: Cup -> Int
getOz aCup = aCup (\flOz -> flOz)

drink :: Cup -> Int -> Cup
drink aCup ozDrank = cup (flOz - ozDrank)
    where flOz = getOz aCup

-- GHCi> afterASip = drink coffeeCup 1
-- GHCi> getOz afterASip
-- 11
-- GHCi> afterTwoSips = drink afterASip 1
-- GHCi> getOz afterTwoSips
-- 10
-- GHCi> afterGulp = drink afterTwoSips 4
-- GHCi> getOz afterGulp
-- 6
