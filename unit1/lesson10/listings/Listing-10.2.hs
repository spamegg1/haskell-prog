type Cup = (Int -> Int) -> Int

cup :: Int -> Cup
cup flOz = \message -> message flOz

coffeeCup :: Cup
coffeeCup = cup 12
