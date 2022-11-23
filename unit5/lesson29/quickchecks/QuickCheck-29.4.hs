-- Solve this problem if the boxes contain a prize multiplier instead
-- of just an additional prize. The multipliers are 10× and 50×.

-- Answer:
doorPrize :: [Int]
doorPrize = [1000, 2000, 3000]

boxPrize :: [Int]
boxPrize = [10, 50]

totalPrize :: [Int]
totalPrize = (pure (*)) <*> doorPrize <*> boxPrize
-- [10000,50000,20000,100000,30000,150000]