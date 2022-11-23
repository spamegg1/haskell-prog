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

-- GHCi> process Brain
-- (Lab,Brain in a vat)
-- GHCi> process Heart
-- (Lab,Heart in a cooler)
-- GHCi> process Spleen
-- (Kitchen,Spleen in a bag)
-- GHCi> process Kidney
-- (Kitchen,Kidney in a bag)
-- GHCi> report (process Brain)
-- "Brain in a vat in the Lab"
-- GHCi> report (process Spleen)
-- "Spleen in a bag in the Kitchen"
