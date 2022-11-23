doorPrize :: [Int]
doorPrize = [1000, 2000, 3000]

boxPrize :: [Int]
boxPrize = [500, 20000]

-- deterministic/single path: does not work:
-- totalPrize :: Int
-- totalPrize = (+) doorPrize boxPrize
