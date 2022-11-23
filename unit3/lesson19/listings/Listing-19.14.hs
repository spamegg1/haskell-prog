import qualified Data.Map as Map

data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq)

data Container = Vat Organ | Cooler Organ | Bag Organ
instance Show Container where
    show (Vat organ) = show organ ++ " in a vat"
    show (Cooler organ) = show organ ++ " in a cooler"
    show (Bag organ) = show organ ++ " in a bag"

data Location = Lab | Kitchen | Bathroom deriving Show

organToContainer :: Organ -> Container
organToContainer Brain = Vat Brain
organToContainer Heart = Cooler Heart
organToContainer organ = Bag organ

placeInLocation :: Container -> (Location, Container)
placeInLocation (Vat organ) = (Lab, Vat organ)
placeInLocation (Cooler organ) = (Lab, Cooler organ)
placeInLocation (Bag organ) = (Kitchen, Bag organ)

process :: Organ -> (Location, Container)
process = placeInLocation . organToContainer

report :: (Location, Container) -> String
report (location, container) = show container ++ " in the " ++ show location

processAndReport :: Maybe Organ -> String
processAndReport Nothing = "error, id not found"
processAndReport (Just organ) = report (process organ)

processRequest :: Int -> Map.Map Int Organ -> String
processRequest id catalog = processAndReport maybeOrgan
    where maybeOrgan = Map.lookup id catalog


-- TESTING
organs :: [Organ]
organs = [Heart,Heart,Brain,Spleen,Spleen,Kidney]
ids :: [Int]
ids = [2,7,13,14,21,24]
organPairs :: [(Int,Organ)]
organPairs = zip ids organs
organCatalog :: Map.Map Int Organ
organCatalog = Map.fromList organPairs
-- GHCi> processRequest 13 organCatalog
-- "Brain in a vat in the Lab"
-- GHCi> processRequest 12 organCatalog
-- "error, id not found"
