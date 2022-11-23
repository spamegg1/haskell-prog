-- Q19.1
-- Write a function emptyDrawers that takes the output of
-- getDrawerContents and tells you the number of drawers that are empty.
import qualified Data.Map as Map
import Data.Maybe  -- for isJust and isNothing

data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq)

getDrawerContents :: [Int] -> Map.Map Int Organ -> [Maybe Organ]
getDrawerContents ids catalog = map getContents ids
    where getContents = \id -> Map.lookup id catalog

-- Answer:
emptyDrawers :: [Maybe Organ] -> Int
emptyDrawers = length . filter isNothing

-- TESTING
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
availableOrgans :: [Maybe Organ]
availableOrgans = getDrawerContents possibleDrawers organCatalog

emptyDrawerCount :: Int -- should be 44: 50 drawers, only 6 organs
emptyDrawerCount = emptyDrawers availableOrgans
