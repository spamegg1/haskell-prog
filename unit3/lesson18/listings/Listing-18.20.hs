import qualified Data.Map as M

data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq)

organs :: [Organ]
organs = [Heart,Heart,Brain,Spleen,Spleen,Kidney]

ids :: [Int]
ids = [2,7,13,14,21,24]

organPairs :: [(Int, Organ)]
organPairs = zip ids organs

-- fromList :: Ord k => [(k,a)] -> Map k a
organCatalog :: M.Map Int Organ
organCatalog = M.fromList organPairs

-- GHCi> Map.lookup 7 organCatalog
-- Just Heart
