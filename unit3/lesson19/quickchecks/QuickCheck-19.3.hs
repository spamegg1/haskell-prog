-- How would you rewrite report so that it works with
-- Maybe (Location, Container) and handles the case of the missing Organ?
data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq)

data Container = Vat Organ | Cooler Organ | Bag Organ
instance Show Container where
    show (Vat organ) = show organ ++ " in a vat"
    show (Cooler organ) = show organ ++ " in a cooler"
    show (Bag organ) = show organ ++ " in a bag"

data Location = Lab | Kitchen | Bathroom deriving Show

-- Answer:
report :: Maybe (Location, Container) -> String
report $ Just (location, container) = show container ++ " in the " ++ show location
report Nothing = "container not found"
