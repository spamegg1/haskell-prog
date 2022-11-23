import qualified Data.Map as Map

data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq)

organs :: [Organ]
organs = [Heart,Heart,Brain,Spleen,Spleen,Kidney]
ids :: [Int]
ids = [2,7,13,14,21,24]
organPairs :: [(Int,Organ)]
organPairs = zip ids organs
organCatalog :: Map.Map Int Organ
organCatalog = Map.fromList organPairs
possibleDrawers :: [Int]
possibleDrawers = [1 .. 50]

getDrawerContents :: [Int] -> Map.Map Int Organ -> [Maybe Organ]
getDrawerContents ids catalog = map getContents ids
    where getContents = \id -> Map.lookup id catalog

availableOrgans :: [Maybe Organ]
availableOrgans = getDrawerContents possibleDrawers organCatalog

isSomething :: Maybe Organ -> Bool
isSomething Nothing = False
isSomething (Just _) = True

justTheOrgans :: [Maybe Organ]
justTheOrgans = filter isSomething availableOrgans

-- GHCi> justTheOrgans
-- [Just Heart,Just Heart,Just Brain,Just Spleen,Just Spleen,Just Kidney]
