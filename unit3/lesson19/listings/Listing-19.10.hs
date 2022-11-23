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
