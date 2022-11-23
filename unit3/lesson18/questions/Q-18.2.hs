-- Q18.2
-- Modify the Organ type so that it can be used as a key.
-- Then build a Map , organInventory , of each organ
-- to its count in the organCatalog .

-- Answer:
import qualified Data.Map as Map

data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq, Ord, Enum)

organs :: [Organ]
organs = [Heart,Heart,Brain,Spleen,Spleen,Kidney]

ids :: [Int]
ids = [2,7,13,14,21,24]

organPairs :: [(Int, Organ)]
organPairs = zip ids organs

-- fromList :: Ord k => [(k,a)] -> Map k a
organCatalog :: Map.Map Int Organ
organCatalog = Map.fromList organPairs


-- Answer:
values :: [Organ]
values = map snd (Map.toList organCatalog)

allOrgans :: [Organ]
allOrgans = [Heart .. Spleen]

organCounts :: [Int]
organCounts = map countOrgan allOrgans
    where countOrgan = (\organ -> (length . filter (== organ)) values)

organInventory :: Map.Map Organ Int
organInventory = Map.fromList (zip allOrgans organCounts)
