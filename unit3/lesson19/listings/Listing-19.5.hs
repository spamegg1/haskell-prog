data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq)

countOrgan :: Organ -> [Maybe Organ] -> Int
countOrgan organ available = length (filter (\x -> x == Just organ) available)
