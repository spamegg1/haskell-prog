data Test1 = AA | ZZ deriving (Eq, Ord)
data Test2 = ZZZ | AAA deriving (Eq, Ord)

-- GHCi> AA < ZZ
-- True
-- GHCi> AA > ZZ
-- False
-- GHCi> AAA > ZZZ
-- True
-- GHCi> AAA < ZZZ
-- False
