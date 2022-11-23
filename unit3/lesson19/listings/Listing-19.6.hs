data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq)

isSomething :: Maybe Organ -> Bool
isSomething Nothing = False
isSomething (Just _) = True
