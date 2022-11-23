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
