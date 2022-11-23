data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq)

showOrgan :: Maybe Organ -> String
showOrgan (Just organ) = show organ
showOrgan Nothing = ""

-- GHCi> showOrgan (Just Heart)
-- "Heart"
-- GHCi> showOrgan Nothing
-- ""
